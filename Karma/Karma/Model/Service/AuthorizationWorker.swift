//
//  AuthorizationWorker.swift
//  Karma
//
//  Created by efvo on 12.12.2022.
//

import Foundation
import Alamofire
import Moya
import SwiftUI


private enum AuthorizationService: TargetType {
    
    var baseURL: URL {
        switch self {
        case .authorization: return URL(string: "http://localhost:8081/api/auth")!
        }
    }
    
    case authorization(login: String, password: String)
    
    var path: String {
        switch self {
        case .authorization: return "/login"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        switch self {
        case let .authorization(login, password):
            let credentialData = "\(login):\(password)".data(using: String.Encoding.utf8)!
            let base64Credentials = credentialData.base64EncodedString(options: [])
            return ["Content-Type": "application/json",
                    "Authorization": "Basic \(base64Credentials)"]
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .authorization(let login, let password):
            return .requestParameters(parameters: ["login": login, "password" : password],
                                      encoding: JSONEncoding.default)
        }
    }
}


protocol AuthorizationWorkerProtocol: AnyObject {
    
    func authorization(withLogin login: String,
                       password: String,
                       completionHandler: @escaping (Result<Authorization>) -> Void)
}

final class AuthorizationWorker: BaseWorker, AuthorizationWorkerProtocol {
    
    public func authorization(withLogin login: String,
                              password: String,
                              completionHandler: @escaping (Result<Authorization>) -> Void) {
        request(AuthorizationService.authorization(login: login, password: password),
                completionHandler: completionHandler)
    }
}
