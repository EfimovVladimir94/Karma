//
//  OrganizationList.swift
//  Karma
//
//  Created by user on 24.12.2022.
//

import Foundation

struct OrganizationList: Codable {
    let organizations: [Organization]
    enum CodingKeys: String, CodingKey {
        case organizations = "organizationList"
    }
}

struct Organization: Codable, Identifiable, Hashable {
    let id: Int
    let name, description: String
}

