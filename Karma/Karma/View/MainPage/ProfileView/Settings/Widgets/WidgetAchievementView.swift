//
//  WidgetAchievementView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI

struct WidgetAchievementView: View {
    var achievements: [Achievement]
    @State var showAchievements = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Мои достижения:")
                .font(.medium(17))
                .foregroundColor(.black)
                .padding(.horizontal, 25)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 25) {
                    ForEach(achievements, id: \.id) { achievement in
                        VStack(spacing: 0) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.primaryAction)
                                    .frame(height: 80)
                                Image(achievement.description)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .padding(.bottom, 10)
                            }
                            .padding(.top, 13)
                            
                            Text(achievement.name)
                                .font(.medium(17))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .frame(width: 130)
                }
                .padding(.top, 10)
                .padding(.leading, 20)
            }
            SubmitButton(title: "Смотреть всё") {
                showAchievements = true
            }
            .padding(.horizontal, 5)
            .padding(.top, 20)
        }
        .padding(.vertical, 15)
        .sheet(isPresented: $showAchievements) {
            AchievementsView(achievements: achievements)
        }
    }
}

struct WidgetAchievementView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetAchievementView(achievements: [.init(id: 1, name: "Отличный старт", description: "Нежный омут")])
    }
}
