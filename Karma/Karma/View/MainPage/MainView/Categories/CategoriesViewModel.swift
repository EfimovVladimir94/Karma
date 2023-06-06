//
//  CategoriesViewModel.swift
//  Karma
//
//  Created by efvo on 08.02.23.
//

import SwiftUI
import Combine

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Category] = [
        .init(type: .all),
        .init(type: .childs),
        .init(type: .animals),
        .init(type: .older),
        .init(type: .homeless),
        .init(type: .abuse),
        .init(type: .nature),
        .init(type: .needy),
        .init(type: .other)
    ]
    
    @Published var selectedCategory: Category?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        $selectedCategory.sink { category in
            guard let category = category else { return }
            let selectedCategories = self.categories.map { item in
                if item == category {
                    return Category.init(isSelect: !item.isSelect, type: category.type)
                }
                return item
            }
            self.categories = selectedCategories
        }
        .store(in: &cancellables)
    }
}

extension CategoriesViewModel {
    struct Category: Identifiable, Hashable {
        var id: String { self.type.title }
        var isSelect: Bool = false
        var type: CategoriesType
    }
    
    enum CategoriesType {
        case all, childs, animals, older, homeless, abuse, nature, needy, other
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
}
