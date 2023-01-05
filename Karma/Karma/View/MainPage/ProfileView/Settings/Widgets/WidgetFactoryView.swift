//
//  WidgetFactoryView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI

struct WidgetFactoryView: View {
    var datasource: WidgetDataSource
    var body: some View {
        switch datasource.type {
        case .points:
            WidgetPointsView()
                .modifier(WidgetModifier())
        case .helped:
            WidgetHelpedView(friends: ["Profile", "Profile", "Profile", "Profile", "Profile"])
                .modifier(WidgetModifier())
        case .achievements:
            WidgetAchievementView(achievemnts: ["Profile", "Profile", "Profile", "Profile", "Profile"])
                .modifier(WidgetModifier())
        }
    }
}

struct WidgetModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Rectangle()
                .fill(Color.white)
                .cornerRadius(21)
                .shadow(
                    color: Color.blue.opacity(0.2),
                    radius: 5,
                    x: 0,
                    y: 0
                ))
    }
}
