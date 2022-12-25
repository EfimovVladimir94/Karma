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
                if completedOnboarding {
                    OnboardingView(viewModel: OnboardingViewModel()) {
                        completedOnboarding = false
                        UserDefaults.standard.set(true, forKey: Constants.Keys.completedOnboarding)
                    }
                } else {
                    AuthorizationView(viewModel: AuthorizationViewModel())
                }
            }
            .onAppear {
                completedOnboarding = !UserDefaults.standard.bool(forKey: Constants.Keys.completedOnboarding)
            }
        }
    }
}
