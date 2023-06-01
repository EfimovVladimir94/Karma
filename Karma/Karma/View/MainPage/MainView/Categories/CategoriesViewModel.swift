//
//  CategoriesViewModel.swift
//  Karma
//
//  Created by efvo on 08.02.23.
//

import SwiftUI

class CategoriesViewModel: ObservableObject {
    
    enum CategoriesType: Identifiable {
        case all, childs, animals, older, homeless, abuse, nature, needy, other
        var id: String {
                self.title
            }
        var title: String {
            switch self {
            case .all: return "Все"
            case .childs: return "Дети"
            case .animals: return "Животные"
            case .older: return "Пожилые"
            case .homeless: return "Бездомные"
            case .abuse: return "Жертвы насилия"
            case .nature: return "Природа"
            case .needy: return "Нуждающиеся"
            case .other: return "Другое"
            }
        }
    }
    
    @Published var categories: [CategoriesType] = [
        .all, .childs, .animals, .older, .homeless, .abuse, .nature, .needy,  .other
    ]
    
}
