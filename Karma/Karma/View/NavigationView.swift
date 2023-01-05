//
//  NavigationView.swift
//  Karma
//
//  Created by efvo on 04.01.2023.
//

import SwiftUI

enum ScreenView {
    case authorization, mainView
}

struct NavigationView: View {
    
    @State public private(set) var currentScreen: ScreenView
    
    var body: some View {
        switch currentScreen {
        case .authorization:
            AuthorizationView(viewModel: AuthorizationViewModel(router: self))
        case .mainView:
            MainPageView(router: self)
        }
    }
    
    public init(withState state: ScreenView) {
        currentScreen = state
    }
    
    public func changeState(_ newState: ScreenView) {
        currentScreen = newState
    }
}
