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
                    if let token = KeychainManager().get(Constants.Keys.token), !token.isEmpty {
                        NavigationView.init(withState: .mainView)
                    } else {
                        NavigationView.init(withState: .authorization)
                    }
                }
            }
            .onAppear {
                completedOnboarding = !UserDefaults.standard.bool(forKey: Constants.Keys.completedOnboarding)
            }
        }
    }
}
