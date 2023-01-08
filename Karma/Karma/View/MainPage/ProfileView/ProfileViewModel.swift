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

        self.login = "Ираклий"
        self.phone = "+995 511 10 77"
        self.email = "montage3by@gmail.com"
        self.achievements = [.init(id: 1, name: "Название", description: "Описание достижения"),
                             .init(id: 2, name: "Название2", description: "Описание достижения")]
        self.invitedFriends = [.init(id: 1, name: "Название", description: ""),
                               .init(id: 1, name: "Название", description: "")]
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
                    self?.showAuthorization = true
                    self?.router.changeState(.authorization)
                    break
                case .failure(_):
                    self?.keychainManager.set("", forKey: Constants.Keys.token)
                    self?.showAuthorization = true
                    self?.router.changeState(.authorization)
                    break
                }
            }
        }
    }
}
