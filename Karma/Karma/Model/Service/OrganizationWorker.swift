//
//  OrganizationWorker.swift
//  Karma
//
//  Created by efvo on 24.12.2022.
//

import Foundation
import Alamofire
import Moya
import SwiftUI


private enum OrganizationService: TargetType {
    
    
    case getOrganizationList
    
    var baseURL: URL {
        switch self {
        case .getOrganizationList:
            return URL(string: "http://localhost:8080/api/v1/main")!
        }
    }
    
    var path: String {
        switch self {
        case .getOrganizationList: return "/organizationList"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer \(KeychainManager().get(Constants.Keys.token) ?? "")"]
    }
    
    var task: Moya.Task {
        switch self {
        case .getOrganizationList:
            return .requestPlain
        }
    }
}


protocol OrganizationWorkerProtocol: AnyObject {
    
    func getOrganizationList(completionHandler: @escaping (Result<[Organization]>) -> Void)
}

final class OrganizationWorker: BaseWorker, OrganizationWorkerProtocol {
    
    public func getOrganizationList(completionHandler: @escaping (Result<[Organization]>) -> Void) {
        request(OrganizationService.getOrganizationList, completionHandler: completionHandler)
    }
}
