//
//  MainViewModel.swift
//  Karma
//
//  Created by efvo on 15.12.2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var defaultList: [Organization] = []
    @Published var filteredList: [Organization] = []
    private let orgWorker = OrganizationWorker()
    
    func loadData() {
        orgWorker.getOrganizationList() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let list):
                    self?.defaultList = list
                    self?.filteredList = list
                case .failure(_):
                    // For Test
                    self?.defaultList = [
                        .init(
                            id: 0, name: "Подари жизнь",
                            description: "Работает с 2011 года, лауреаты премии мира и всего всего на свете."),
                        .init(
                            id: 1, name: "Тест",
                            description: "Работает с 2021 года, лауреаты премии мира и всего всего на свете.")
                    ]
                    break
                }
            }
        }
    }
    
    func search(by name: String) {
        guard name.isEmpty else {
            filteredList = defaultList
                .filter { org in
                    org.name.lowercased().contains(name.lowercased())
                }
            return
        }
        filteredList = defaultList
    }
}
