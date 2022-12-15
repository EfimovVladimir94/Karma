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
        case .authorization, .registration: return URL(string: "http://localhost:8081/api/auth")!
        }
    }
    
    case authorization(login: String, password: String)
    case registration(login: String, password: String, email: String)
    
    var path: String {
        switch self {
        case .authorization: return "/login"
        case .registration: return "/register"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return [:]
    }
    
    var task: Moya.Task {
        switch self {
        case .authorization(let login, let password):
            return .requestParameters(
                parameters: [
                    "login": login,
                    "password" : password
                ],
                encoding: JSONEncoding.default)
        case .registration(let login, let password, let email):
            return .requestParameters(
                parameters: [
                    "login": login,
                    "password" : password,
                    "email" : email
                ],
                encoding: JSONEncoding.default
            )
        }
    }
}


protocol AuthorizationWorkerProtocol: AnyObject {
    
    func authorization(withLogin login: String,
                       password: String,
                       completionHandler: @escaping (Result<Authorization>) -> Void)
    func registration(withLogin login: String,
                      password: String,
                      email: String,
                      completionHandler: @escaping (Result<String>) -> Void)
}

final class AuthorizationWorker: BaseWorker, AuthorizationWorkerProtocol {
    
    public func authorization(withLogin login: String,
                              password: String,
                              completionHandler: @escaping (Result<Authorization>) -> Void) {
        request(AuthorizationService.authorization(login: login, password: password),
                completionHandler: completionHandler)
    }
    
    public func registration(withLogin login: String,
                             password: String,
                             email: String,
                             completionHandler: @escaping (Result<String>) -> Void) {
        request(
            AuthorizationService.registration(
                login: login,
                password: password,
                email: email
            ),
            completionHandler: completionHandler)
    }
}
