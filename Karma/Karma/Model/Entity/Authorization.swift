//
//  Authorization.swift
//  Karma
//
//  Created by efvo on 13.12.2022.
//

import Foundation
import SwiftUI

public struct Authorization: Codable {
    public let accessToken: String
    public let tokenType: String?
}
