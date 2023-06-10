//
//  News.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import Foundation
struct News: Codable, Identifiable, Hashable {
    let id: Int
    let title, description, imageUrl: String
}
