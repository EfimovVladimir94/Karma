//
//  WidgetHelpedView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI

struct WidgetHelpedView: View {
    var friends: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Через вас помогли на сумму")
                .font(.medium(17))
                .padding(.horizontal, 25)
            Text("154 ₽")
                .font(.medium(25))
                .padding(.top, 3)
                .padding(.horizontal, 25)
            Text("Люди которых вы пригласили:")
                .font(.medium(17))
                .padding(.top, 22)
                .padding(.horizontal, 25)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(friends, id: \.description) { friend in
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: 20) {
                                ForEach(friends, id: \.description) { friend in
                                    Image(friend)
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                }
                .padding(.leading, 20)
            }
            Button {
                //TODO: sharelinck
            } label: {
                ZStack {
                    Color.blue
                    Text("Расскажите о приложении")
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
    }
}

struct WidgetHelpedView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetHelpedView(friends: ["Profile"])
    }
}
