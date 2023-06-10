//
//  NewsViewModel.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: [News] = []
    
    init() {
        loadData()
    }
    
    func loadData() {
        
        news = [
            .init(id: 0, title: "Название статьи",
                  description: "Приложение KARMA позволяет пользователям сделать пожертвования в деньгах или вещах напрямую через приложение. Это означает, что пользователи могут легко и удобно поделиться своими ресурсами с теми, кто нуждается в помощи, не выходя из дома.",
                  imageUrl: "testnews1"),
            .init(id: 0, title: "Название статьи",
                  description: "Приложение KARMA позволяет пользователям сделать пожертвования в деньгах или вещах напрямую через приложение. Это означает, что пользователи могут легко и удобно поделиться своими ресурсами с теми, кто нуждается в помощи, не выходя из дома.",
                  imageUrl: "testnews2"),
        ]
    }
}
