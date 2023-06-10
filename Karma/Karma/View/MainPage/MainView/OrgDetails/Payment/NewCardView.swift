//
//  NewCardView.swift
//  Karma
//
//  Created by Vladimir on 09.06.23.
//

import SwiftUI

struct NewCardView: View {
    @State var cardNumber = ""
    @State var cardExpireDate = ""
    var body: some View {
        VStack(spacing: 0) {
            HeaderModalView()
            VStack(spacing: 0) {
                Text("Привязка новой карты")
                    .font(.medium(25))
                    .foregroundColor(.black)
                Text("Данные вашей карты надежно защищены. При дальнейших платежах повторно вводить данные не потребуется. ")
                    .font(.regular(15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.top, 10)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Номер карты")
                        .font(.regular(15))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding(.top, 30)
                    CstTextField(
                        text: $cardNumber,
                        imageName: "card",
                        placeholder: "1234 5678 9012 3456"
                    )
                    HStack(spacing: 52) {
                        VStack {
                            Text("Месяц/год")
                                .font(.regular(15))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            CstTextField(text: $cardExpireDate, placeholder: "04/22", height: 30)
                                .lineLimit(1)
                        }

                        VStack {
                            Text("CVC код")
                                .font(.regular(15))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                            CstTextField(text: $cardExpireDate, placeholder: "888", height: 30)
                                .lineLimit(1)
                            
                        }
                        Spacer()
                    }
                    SubmitButton(title: "Сохранить карту") {
                        
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal, 30)
               
                Spacer()
            }
            .padding(.horizontal, 15)
            
        }
    }
}

struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView()
    }
}
