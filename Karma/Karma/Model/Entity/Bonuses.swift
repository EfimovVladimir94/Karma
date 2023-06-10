//
//  Bonuses.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import Foundation
struct Bonuses: Codable, Hashable {
    let total: Int
    let bonuses: [Bonus]
}

struct Bonus: Codable, Identifiable, Hashable {
    let id: Int
    let title, description: String
    let price: Int
}
