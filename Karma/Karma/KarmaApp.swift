//
//  KarmaApp.swift
//  Karma
//
//  Created by Vladimir on 13.12.2022.
//

import SwiftUI

@main
struct KarmaApp: App {
    var body: some Scene {
        WindowGroup {
            AuthorizationView(viewModel: AuthorizationViewModel())
        }
    }
}
