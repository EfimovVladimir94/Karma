//
//  RegistrationViewModel.swift
//  Karma
//
//  Created by efvo on 14.12.2022.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    private let authWorker = AuthorizationWorker()
    
    public func registration() {
        authWorker.registration(withLogin: username, password: password, email: email) { result in
            switch result {
            case .success:
                break
            case .failure(let error):
                break
            }
        }
    }
}
