//
//  ContentView.swift
//  Karma
//
//  Created by efvo on 05.12.2022.
//

import SwiftUI

struct AuthorizationView: View {
    @ObservedObject var viewModel: AuthorizationViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image("LaunchLogo")
                    .frame(width: 227, height: 157, alignment: .center)
                    .padding(.top, 70)
                loginPassView
                    .padding(.top, 21)
                HStack {
                    Text("Забыли пароль?")
                        .foregroundColor(.black)
                        .font(.medium(15))
                    Text("Нажмите сюда")
                        .foregroundColor(.blue)
                        .font(.bold(15))
                }
                .padding(.top, 14)
                .padding(.horizontal, 10)
                Button {
                    viewModel.loginAction()
                } label: {
                    ZStack {
                        Color.blue
                        Text("Вход")
                            .font(.bold(18))
                            .foregroundColor(Color.white)
                    }
                }
                .cornerRadius(10)
                .frame(height: 56, alignment: .center)
                .padding(.top, 25)
                Spacer()
                VStack(spacing: 0) {
                    Text("Авторизироваться через соц. сети")
                        .foregroundColor(.black)
                        .font(.medium(15))
                        .frame(alignment: .center)
                    HStack(spacing: 15) {
                        Image("Instagram")
                            .frame(width: 42, height: 42, alignment: .center)
                            .background(Circle.init().foregroundColor(.blue))
                            .onTapGesture {
                            }
                        Image("Telegram")
                            .frame(width: 42, height: 42, alignment: .center)
                            .background(Circle.init().foregroundColor(.blue))
                            .onTapGesture {
                            }
                        Image("Google")
                            .frame(width: 42, height: 42, alignment: .center)
                            .background(Circle.init().foregroundColor(.blue))
                            .onTapGesture {
                            }
                    }
                    .padding(.top, 14)
                    HStack {
                        Text("Нет аккаунта?")
                            .foregroundColor(.black)
                            .font(.medium(15))
                        Text("Зарегистрироваться")
                            .foregroundColor(.blue)
                            .font(.bold(15))
                    }
                    .padding(.top, 14)
                    .padding(.horizontal, 10)
                }
            }
            .ignoresSafeArea(.keyboard)
            .padding(.horizontal, 40)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView(viewModel: AuthorizationViewModel())
    }
}
