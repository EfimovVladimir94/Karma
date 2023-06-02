//
//  AuthorizationView+Content.swift
//  Karma
//
//  Created by efvo on 14.12.2022.
//

import SwiftUI

extension AuthorizationView {
    var content: some View {
        ZStack {
            Color.white.ignoresSafeArea()
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
                .frame(height: 53, alignment: .center)
                .padding(.top, 25)
                Spacer()
                VStack(spacing: 0) {
                    Text("Авторизироваться через соц. сети")
                        .foregroundColor(.black)
                        .font(.medium(15))
                        .frame(alignment: .center)
                    HStack(spacing: 15) {
                        Image("Google")
                            .frame(width: 42, height: 42, alignment: .center)
                            .background(Circle.init().foregroundColor(.blue))
                            .onTapGesture {
                            }
                        Image("apple")
                            .frame(width: 42, height: 42, alignment: .center)
                            .background(Circle.init().foregroundColor(.blue))
                            .onTapGesture {
                            }
                        Image("facebook")
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
                            .onTapGesture {
                                showRegistration = true
                            }
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
