//
//  ProfileViewModel.swift
//  Karma
//
//  Created by efvo on 04.01.2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    public let router: NavigationView
    private let settingsWorker = SettingsProfileWorker()
    private let keychainManager = KeychainManager()
    @Published var showAuthorization: Bool = false
    @Published var achievements: [Achievement] = []
    @Published var invitedFriends: [InvitedFriends] = []
    @Published var login = ""
    @Published var phone = ""
    @Published var email = ""
    
    init(router: NavigationView) {
        self.router = router
        loadData()
    }
    
    func loadData() {
        loadAchievements()
        loadInvitedFriends()
    }
    
    func loadUserInfo() {
        settingsWorker.getUserinfo() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self?.login = user.login
                    self?.phone = user.phone
                    self?.email = user.email
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func updateUserInfo() {
        settingsWorker.updateUserInfo(withLogin: login, phone: phone, email: email) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let newToken):
                    self?.keychainManager.set(newToken, forKey: Constants.Keys.token)
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func loadAchievements() {
        settingsWorker.getMyAchievements { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self?.achievements = list
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func loadInvitedFriends() {
        settingsWorker.getInvitedFriends { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self?.invitedFriends = list
                case .failure(_):
                    break
                }
            }
        }
    }
    
    func logOut() {
        settingsWorker.logout() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(_):
                    self?.keychainManager.set("", forKey: Constants.Keys.token)
                    self?.router.changeState(.authorization)
                    break
                case .failure(_):
                    self?.router.changeState(.authorization)
                }
            }
        }
    }
}
