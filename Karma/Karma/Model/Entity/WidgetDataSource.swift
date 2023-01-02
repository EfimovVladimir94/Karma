//
//  WidgetDataSource.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI

enum WidgetType {
    case points, helped, achievements
}

struct WidgetDataSource: Hashable {
    var amountLbl: String
    var type: WidgetType
    var friends: [String] = []
    var achievements: [String] = []
}
