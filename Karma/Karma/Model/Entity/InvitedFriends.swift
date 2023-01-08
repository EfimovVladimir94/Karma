//
//  InvitedFriends.swift
//  Karma
//
//  Created by efvo on 06.01.2023.
//

import Foundation

struct InvitedFriends: Codable, Identifiable, Hashable {
    let id: Int
    let name, description: String
}
