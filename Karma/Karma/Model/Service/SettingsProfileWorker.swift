//
//  SettingsProfileWorker.swift
//  Karma
//
//  Created by user on 04.01.2023.
//

import Alamofire
import Moya
import SwiftUI


private enum SettingsProfileService: TargetType {
    
    
    case logout
    
    var baseURL: URL {
        switch self {
        case .logout:
            return URL(string: "http://192.168.100.10:8081/api/auth")!
        }
    }
    
    var path: String {
        switch self {
        case .logout: return "/logout"
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer \(KeychainManager().get(Constants.Keys.token) ?? "")"]
    }
    
    var task: Moya.Task {
        switch self {
        case .logout:
            return .requestPlain
        }
    }
}


protocol SettingsProfileWorkerProtocol: AnyObject {
    
    func logout(completionHandler: @escaping (Result<String>) -> Void)
}

final class SettingsProfileWorker: BaseWorker, SettingsProfileWorkerProtocol {
    
    public func logout(completionHandler: @escaping (Result<String>) -> Void) {
        request(SettingsProfileService.logout, completionHandler: completionHandler)
    }
}
