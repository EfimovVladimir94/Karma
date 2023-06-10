//
//  KarmaBonusView.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import SwiftUI

struct KarmaBonusView: View {
    var body: some View {
        ZStack {
            background.cornerRadius(20, corners: [.topLeft, .topRight])
                .ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Image("close")
                        .resizable()
                        .frame(width: 22, height: 22)
                    Spacer()
                    Image("clearhint")
                        .resizable()
                        .frame(width: 22, height: 22)
                }
                .padding(16)
                HStack(spacing: 0) {
                    Text("У Вас 165")
                        .font(.semibold(25))
                        .foregroundColor(.white)
                    Image("karmalogo")
                        .resizable()
                        .frame(width: 30, height: 22)
                        .padding(.leading, 5)
                }
                Text("Выберите, на что потратить")
                    .font(.regular(15))
                    .foregroundColor(.white)
                KarmaBonusSliderView()
                    .padding(.top, 40)
                HStack {
                    Image("history")
                        .resizable()
                        .frame(width: 22, height: 22)
                    Text("История")
                        .font(.semibold(15))
                        .foregroundColor(.white)
                    Spacer()
                }
                .padding(.top, 50)
                .padding(.leading, 45)
                Spacer()
            }
        }
    }
    
    var background: some View {
        Rectangle()
            .fill(LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0, green: 0.38, blue: 1),
                    Color(red: 0, green: 0.38, blue: 1),
                    Color(red: 0.376, green: 0.937, blue: 1)
                ]),
                startPoint: .top,
                endPoint: .bottom
            ))
    }
}

struct KarmaBonusView_Previews: PreviewProvider {
    static var previews: some View {
        KarmaBonusView()
    }
}
