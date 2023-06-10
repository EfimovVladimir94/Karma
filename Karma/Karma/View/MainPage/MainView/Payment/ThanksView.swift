//
//  ThnaksView.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import SwiftUI

struct ThanksView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("LaunchLogo")
                .frame(width: 227, height: 157, alignment: .center)
                .padding(.top, 70)
            Text("Спасибо! \n Ваше пожертвование успешно доставлено фонду!")
                .font(.medium(20))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top, 20)
            SubmitButton(title: "Главная страница") {
                
            }
            SubmitButton(title: "Перейти в профиль", isInvertStyle: true) {
                
            }
          Spacer()
        }
        .padding(.horizontal, 22)
    }
}

struct ThnaksView_Previews: PreviewProvider {
    static var previews: some View {
        ThanksView()
    }
}
