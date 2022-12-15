//
//  Authorization.swift
//  Karma
//
//  Created by efvo on 13.12.2022.
//

import Foundation

public struct Authorization: Codable {
    public let accessToken: String
    public let tokenType: String?
}
