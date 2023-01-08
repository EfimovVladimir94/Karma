//
//  AchievementsView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI
struct AchievementsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var achievements: [Achievement]
    
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
        }
        .padding(.horizontal, 25)
    }
    
    var content: some View {
        LazyVStack(spacing: 20) {
            ForEach(achievements, id: \.id) { item in
                HStack(spacing: 16) {
                    Rectangle()
                        .foregroundColor(Color.gray)
                        .frame(width: 135, height: 116)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(item.name)
                            .font(.medium(17))
                            .foregroundColor(.black)
                        Text(item.description)
                            .font(.medium(13))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(16)
                .modifier(WidgetModifier())
            }
        }
        .padding(.horizontal, 20)
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView(achievements: [.init(id: 1, name: "Рем Дигга", description: "как Пак")])
    }
}
