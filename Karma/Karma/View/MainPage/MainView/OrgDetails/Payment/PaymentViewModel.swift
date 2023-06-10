//
//  PaymentViewModel.swift
//  Karma
//
//  Created by Vladimir on 09.06.23.
//

import Foundation
import SwiftUI

class PaymentViewModel: ObservableObject {
    @Published var paymentMethodTypes: [PaymentMethod] = [
        .init(type: .applePay, isSelected: false, iconName: "apay"),
        .init(type: .custom(title: "Mastercard 2034"), isSelected: false, iconName: "mastercard"),
        .init(type: .newCard, isSelected: false, iconName: "card")
    ]
    
    func selectMethod(method: PaymentMethod) {
        paymentMethodTypes.indices.forEach { paymentMethodTypes[$0].isSelected = false }
        let index = paymentMethodTypes.firstIndex(where: { item in
            item.id == method.id
        })
        if let index = index, method.type != .newCard{
            paymentMethodTypes[index].isSelected.toggle()
        }
    }
    
}

extension PaymentViewModel {
    struct PaymentMethod: Identifiable {
        let id = UUID()
        var type: PaymentMethodType
        var isSelected: Bool
        var iconName: String
    }
    
    enum PaymentMethodType: Equatable {
        case applePay, newCard, custom(title: String)
        var value: String {
            switch self {
            case .applePay: return "Apple pay"
            case .custom(let title): return title
            case .newCard: return "Новая карта"
            }
        }
        
        static func == (lhs: PaymentMethodType, rhs: PaymentMethodType) -> Bool {
                switch (lhs, rhs) {
                case (.applePay, .applePay):
                    return true
                case (.newCard, .newCard):
                    return true
                case let (.custom(title1), .custom(title2)):
                    return title1 == title2
                default:
                    return false
                }
            }
    }
}
