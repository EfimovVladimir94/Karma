//
//  KarmaApp.swift
//  Karma
//
//  Created by Vladimir on 13.12.2022.
//

import SwiftUI

@main
struct KarmaApp: App {
    @State var completedOnboarding = false
    var body: some Scene {
        WindowGroup {
            ZStack {
                AuthorizationView(viewModel: AuthorizationViewModel())
                if completedOnboarding {
                    OnboardingView() {
                        completedOnboarding = false
                        UserDefaults.standard.set(true, forKey: Constants.Keys.completedOnboarding)
                    }
                }
            }
            .onAppear {
                completedOnboarding = !UserDefaults.standard.bool(forKey: Constants.Keys.completedOnboarding)
            }
        }
    }
}
