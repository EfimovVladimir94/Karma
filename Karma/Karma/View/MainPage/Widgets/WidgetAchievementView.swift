//
//  WidgetAchievementView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI

struct WidgetAchievementView: View {
    var achievemnts: [String]
    @State var showAchievements = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Мои достижения:")
                .font(.medium(17))
                .padding(.horizontal, 25)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(achievemnts, id: \.description) { friend in
                        VStack(spacing: 0) {
                            Image(friend)
                                .resizable()
                                .frame(width: 70, height: 70)
                            Text("Название")
                                .font(.medium(17))
                                .padding(.top, 22)
                        }
                    }
                }
                .padding(.top, 10)
                .padding(.leading, 20)
            }
            Button {
                showAchievements = true
            } label: {
                ZStack {
                    Color.blue
                    Text("Смотреть всё")
                        .font(.bold(18))
                        .foregroundColor(Color.white)
                }
            }
            .cornerRadius(10)
            .frame(height: 53, alignment: .center)
            .padding(.top, 20)
            .padding(.horizontal, 25)
        }
        .padding(.vertical, 15)
        .sheet(isPresented: $showAchievements) {
            AchievementsView(achievements: ["Название", "Название2", "Название3"])
        }
    }
}

struct WidgetAchievementView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetAchievementView(achievemnts: ["Profile", "Profile", "Profile", "Profile", "Profile"])
    }
}
