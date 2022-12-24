//
//  MainViewModel.swift
//  Karma
//
//  Created by efvo on 15.12.2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var organizationList: OrganizationList?
    private let authWorker = OrganizationWorker()
    
    func loadData() {
        authWorker.getOrganizationList() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self?.organizationList = list
                case .failure(let error):
                    print("getOrganizationList: \(error.localizedDescription)")
                    // For Test
                    self?.organizationList = OrganizationList(organizations: [
                        .init(
                            id: 0, name: "Подари жизнь",
                            description: "Работает с 2011 года, лауреаты премии мира и всего всего на свете."),
                        .init(
                            id: 1, name: "Подари жизнь2",
                            description: "Работает с 2021 года, лауреаты премии мира и всего всего на свете.")
                    ])
                    break
                }
            }
        }
        
    }
}
