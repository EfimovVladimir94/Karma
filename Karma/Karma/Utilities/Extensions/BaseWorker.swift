//
//  BaseWorker.swift
//  Karma
//
//  Created by efvo on 11.12.2022.
//

import Foundation
import Alamofire
import Moya

public enum Result<Value> {
    case success(Value)
    case failure(NetworkError)
}

protocol BaseWorkerProtocol {
    func request<T: Decodable, R: TargetType>(_ request: R,
                                              completionHandler: @escaping (Result<T>) -> Void)
}

open class BaseWorker: BaseWorkerProtocol {
    
    public final func request<T: Decodable, R: TargetType>(_ request: R,
                                                           completionHandler: @escaping (Result<T>) -> Void) {
        let queue = DispatchQueue(label: "com.baseWorker.network",
                                  qos: .default,
                                  attributes: .concurrent,
                                  autoreleaseFrequency: .never,
                                  target: nil)
        queue.async {
            let provider = MoyaProvider<R>(callbackQueue: DispatchQueue.global(qos: .default))
            provider.request(request) { result in
                switch result {
                case .success(let response):
                    let networkResponse = NetworkResponse(withResponse: response)
                    let statusCode = networkResponse.statusCode
                    switch statusCode {
                    case .success, .info, .redirect:
                        let decoder = JSONDecoder()
                        do {
                            let data = try decoder.decode(T.self, from: response.data)
                            completionHandler(.success(data))
                            print("Authorization \(data)")
                        } catch let error {
                            if let string = String(data: response.data, encoding: .utf8),
                               let object = string as? T {
                                completionHandler(.success(object))
                            } else {
                                completionHandler(.failure(.init(withType: .parsingError)))
                            }
                        }
                    case .client(let error), .server(let error), .unknown(let error):
                        print("Authorization \(error.localizedDescription)")
                        completionHandler(.failure(error))
                    }
                case .failure(let error):
                    completionHandler(.failure(.init(withType: .customError(error: error))))
                }
            }
        }
    }
    
}

