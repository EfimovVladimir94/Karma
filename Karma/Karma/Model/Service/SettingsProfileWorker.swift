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
    
    case logout, myAchievements, invitedFriends, userInfo
    case updateUserInfo(login: String, phone: String, email: String)
    
    var baseURL: URL {
        switch self {
        case .logout:
            return URL(string: "http://localhost:8080/api/auth")!
        case .myAchievements, .invitedFriends, .updateUserInfo, .userInfo:
            return URL(string: "http://localhost:8080/api/v1/profile")!
        }
    }
    
    var path: String {
        switch self {
        case .logout: return "/logout"
        case .myAchievements: return "/myAchievements"
        case .invitedFriends: return "/invitedFriends"
        case .updateUserInfo: return "/updateUserInfo"
        case .userInfo: return "/userInfo"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .logout, .updateUserInfo:
            return .post
        case .invitedFriends, .myAchievements, .userInfo:
            return .get
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Authorization": "Bearer \(KeychainManager().get(Constants.Keys.token) ?? "")"]
    }
    
    var task: Moya.Task {
        switch self {
        case .logout, .myAchievements, .invitedFriends, .userInfo:
            return .requestPlain
        case .updateUserInfo(let login, let phone, let email):
            return .requestParameters(
                parameters: [
                    "login": login,
                    "phone" : phone,
                    "email" : email
                ],
                encoding: JSONEncoding.default)
        }
    }
}

protocol SettingsProfileWorkerProtocol: AnyObject {
    
    func logout(completionHandler: @escaping (Result<String>) -> Void)
    func getMyAchievements(completionHandler: @escaping (Result<[Achievement]>) -> Void)
    func getInvitedFriends(completionHandler: @escaping (Result<[InvitedFriends]>) -> Void)
    func getUserinfo(completionHandler: @escaping (Result<User>) -> Void)
    func updateUserInfo(withLogin login: String,
                        phone: String,
                        email: String,
                        completionHandler: @escaping (Result<String>) -> Void)
}

final class SettingsProfileWorker: BaseWorker, SettingsProfileWorkerProtocol {
    
    public func logout(completionHandler: @escaping (Result<String>) -> Void) {
        request(SettingsProfileService.logout, completionHandler: completionHandler)
    }
    
    public func getMyAchievements(completionHandler: @escaping (Result<[Achievement]>) -> Void) {
        request(SettingsProfileService.myAchievements, completionHandler: completionHandler)
    }
    public func getInvitedFriends(completionHandler: @escaping (Result<[InvitedFriends]>) -> Void) {
        request(SettingsProfileService.invitedFriends, completionHandler: completionHandler)
    }
    public func updateUserInfo(withLogin login: String,
                               phone: String,
                               email: String,
                               completionHandler: @escaping (Result<String>) -> Void) {
        request(SettingsProfileService.updateUserInfo(login: login, phone: phone, email: email), completionHandler: completionHandler)
    }
    public func getUserinfo(completionHandler: @escaping (Result<User>) -> Void) {
        request(SettingsProfileService.userInfo, completionHandler: completionHandler)
    }
}
