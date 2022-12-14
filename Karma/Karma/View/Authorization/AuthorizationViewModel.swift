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
    private let authWorker = AuthorizationWorker()
    
    public func loginAction() {
        authWorker.authorization(withLogin: username, password: password) { [weak self] result in
            switch result {
            case .success:
                break
                
            case .failure(let error):
                break
                //                DispatchQueue.main.async {
                //                    self?.showingLoader = false
                //                }
                //                Log(error.localizedDescription)
                //                DispatchQueue.main.async {
                //                    self?.showingError = "Неправильный логин и пароль"
                //                }
            }
        }
    }
}
