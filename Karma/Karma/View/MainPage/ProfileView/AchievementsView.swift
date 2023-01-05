//
//  AchievementsView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI
struct AchievementsView: View {
    @Environment(\.presentationMode) var presentationMode
    var achievements: [String]
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack {
                    header
                    content
                }
            }
            .padding(.top, 16)
        }
    }
    
    var header: some View {
        HStack {
            Text("Достижения")
                .font(.medium(25))
                .foregroundColor(.black)
            Spacer()
            Text("Готово")
                .font(.bold(13))
                .foregroundColor(.black)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
                .font(.bold(13))
        }
        .padding(.horizontal, 25)
    }
    
    var content: some View {
        LazyVStack(spacing: 20) {
            ForEach(achievements, id: \.description) { items in
                HStack(spacing: 16) {
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .frame(width: 135, height: 116)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(items)
                            .font(.medium(17))
                            .foregroundColor(.black)
                        Text("Описание достижения")
                            .font(.medium(13))
                            .foregroundColor(.black)
                        Spacer()
                    }
                }
                .padding(16)
                .modifier(WidgetModifier())
            }
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(achievements: ["Название", "Название2", "Название3"])
    }
}
