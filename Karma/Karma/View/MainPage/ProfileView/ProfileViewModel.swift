//
//  ProfileViewModel.swift
//  Karma
//
//  Created by user on 04.01.2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    public let router: NavigationView
    private let settingsWorker = SettingsProfileWorker()
    private let keychainManager = KeychainManager()
    @Published var showAuthorization: Bool = false
    
    init(router: NavigationView) {
        self.router = router
    }
    
    func logOut() {
        settingsWorker.logout() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self?.keychainManager.set("", forKey: Constants.Keys.token)
                    self?.showAuthorization = true
                    self?.router.changeState(.authorization)
                    break
                case .failure(_):
                    break
                }
            }
        }
    }
}
