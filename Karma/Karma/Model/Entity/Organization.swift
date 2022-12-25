//
//  Organization.swift
//  Karma
//
//  Created by efvo on 24.12.2022.
//

import Foundation

struct Organization: Codable, Identifiable, Hashable {
    let id: Int
    let name, description: String
}

