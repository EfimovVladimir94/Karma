//
//  AuthorizationViewModel.swift
//  Karma
//
//  Created by efvo on 11.12.2022.
//

import Foundation
import SwiftUI

class AuthorizationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showMainPage: Bool = false
    @Published var loginError: String?
    @Published var passwordError: String?
    private let authWorker = AuthorizationWorker()
    private let keychainManager = KeychainManager()
    
    enum AuthorizationError {
        case loginEmpty, passwordEmpty, incorrectCredentials
        
        var title: String {
            switch self {
            case .incorrectCredentials:
                return "Неверный логин или пароль"
            case .loginEmpty:
                return "Пожалуйста введите ваш login"
            case .passwordEmpty:
                return "Пожалуйста введите ваш пароль"
            }
        }
    }
    
    public func loginAction() {
        validation(login: username, password: password)
        if loginError != nil || passwordError != nil {
            return
        }
        
        authWorker.authorization(withLogin: username, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let auth):
                    self?.showMainPage = true
                    self?.keychainManager.set(auth.accessToken, forKey: Constants.Keys.token)
                    break
                case .failure(let error):
                    let errorTitle = AuthorizationError.incorrectCredentials.title
                    withAnimation {
                        self?.passwordError = error.localizedDescription == errorTitle ? errorTitle : nil
                    }
                    // for test
                    //                self?.showMainPage = true
                    break
                }
            }
        }
    }
    
    func validation(login: String, password: String) {
        withAnimation {
            loginError = login.isEmpty ? AuthorizationError.loginEmpty.title : nil
            passwordError = password.isEmpty ? AuthorizationError.passwordEmpty.title : nil
        }
    }
}
