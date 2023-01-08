//
//  WidgetSubscribersView.swift
//  Karma
//
//  Created by efvo on 06.01.2023.
//

import SwiftUI

struct WidgetSubscribersView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                VStack (alignment: .leading) {
                    Text("Мои подписки:")
                        .font(.medium(17))
                        .foregroundColor(.black)
                    Text("К сожалению, на данный момент вы не помогаете ни одному фонду")
                        .font(.medium(15))
                        .foregroundColor(.black)
                }
                Button {
                    //TODO: choose fund
                } label: {
                    ZStack {
                        Color.blue
                        Text("Выбрать фонд")
                            .font(.bold(18))
                            .foregroundColor(Color.white)
                    }
                }
                .cornerRadius(10)
                .frame(height: 53, alignment: .center)
                .padding(.top, 20)
            }
            .padding(.horizontal, 23)
            .padding(.vertical, 14)
        }
    }
}
