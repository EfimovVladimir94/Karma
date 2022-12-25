//
//  OnboardingViewModel.swift
//  Karma
//
//  Created by efvo on 25.12.2022.
//

import Foundation

class OnboardingViewModel: ObservableObject {
    
    @Published var selection: Int = 0
    @Published var data: OnboardingData = .firstPage
    
    enum OnboardingData {
        case firstPage, secondPage, thirdPage, endPage
        
        var descriprion: String {
            switch self {
            case .firstPage:
                return "Текст рассказывающий суть приложения, тоже самое повторяем на следующих 4 слайдах"
            case .secondPage:
                return "Текст рассказывающий тоже самое повторяем на следующих 3 слайдах"
            case .thirdPage:
                return "Текст рассказывающий суть , тоже самое повторяем на следующих 2 слайдах"
            case .endPage:
                return "ММММ Хуета, тоже самое повторяем на следующих 1 слайдах"
            }
        }
    }
    
    func nextPage() {
        switch selection {
        case 1:
            data = .firstPage
        case 2:
            data = .secondPage
        case 3:
            data = .thirdPage
        case 4:
            data = .endPage
        default:
            break
        }
    }
    
}
