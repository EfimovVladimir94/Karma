//
//  CategoriesViewModel.swift
//  Karma
//
//  Created by efvo on 08.02.23.
//

import SwiftUI

class CategoriesViewModel: ObservableObject {
    
    @Published var categories: [String] = [
        "Все", "Дети", "Животные", "Пожилые",
        "Бездомные", "Жертвы насилия", "Природа",
        "Нуждающиеся", "Другое"]
    
}
