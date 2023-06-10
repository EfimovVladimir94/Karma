//
//  NewsDetailsView.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import SwiftUI

struct NewsDetailsView: View {
    @State var showPayment = false
    var body: some View {
        VStack(spacing: 0) {
            HeaderModalView()
            ScrollView {
                VStack(spacing: 0) {
                    
                    Text("Название статьи")
                        .font(.medium(25))
                        .foregroundColor(.black)
                    Image("testnews1")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 15)
                    
                    Text("Приложение KARMA позволяет пользователям сделать пожертвования в деньгах или вещах напрямую через приложение. Это означает, что пользователи могут легко и удобно поделиться своими ресурсами с теми, кто нуждается в помощи, не выходя из дома. Многие пользователи приложения KARMA ищут возможности помочь тем, кто нуждается в помощи, и готовы делать пожертвования на благотворительность. В результате благодаря приложению KARMA, детский фонд в Тбилиси получил больше пожертвований, которые были использованы для поддержки множества детей, нуждающихся в помощи.")
                        .font(.regular(15))
                        .foregroundColor(.black)
                        .padding(.top, 15)
                    Spacer()
                    
                }
                .padding(.horizontal, 45)
            }
            SubmitButton(title: "Пожертвовать фонду") {
                showPayment.toggle()
            }
            .padding(.horizontal, 45)
        }
        .sheet(isPresented: $showPayment) {
            PaymentView()
        }
    }
}

struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsView()
    }
}
