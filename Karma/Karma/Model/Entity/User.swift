//
//  User.swift
//  Karma
//
//  Created by efvo on 08.01.2023.
//

import Foundation

struct User: Codable, Hashable {
    let login, phone, email: String
}
