//
//  OnboardingView.swift
//  Karma
//
//  Created by user on 13.12.2022.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image("OnboardingLogo")
                    .padding(.horizontal, 45)
                    .padding(.bottom, 20)
                    .onTapGesture {
                        UserDefaults.standard.set(true, forKey: Constants.Keys.toShowOnboarding)
                    }
                Text("Стать другом фонда и начать помогать благотворительным организациям очень просто!")
                    .foregroundColor(.black)
                    .font(.bold(25))
                    .padding(.bottom, 13)
                    .multilineTextAlignment(.center)
                Text("Расскажем ниже на пальцах!")
                    .foregroundColor(.black)
                    .font(.medium(20))
                    .frame(alignment: .center)
            }
            .padding(.horizontal, 45)
        }
    }
}
