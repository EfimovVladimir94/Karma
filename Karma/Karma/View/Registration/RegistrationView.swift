//
//  RegistrationView.swift
//  Karma
//
//  Created by efvo on 14.12.2022.
//

import SwiftUI

struct RegistrationView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 0) {
                header
                ScrollView {
                    VStack(spacing: 0) {
                        Image("LaunchLogo")
                            .frame(width: 227, height: 157, alignment: .center)
                            .padding(.top, 70)
                        form
                            .padding(.top, 21)
                        Button {
                            viewModel.registration()
                        } label: {
                            ZStack {
                                Color.blue
                                Text("Регистрация")
                                    .font(.bold(18))
                                    .foregroundColor(Color.white)
                            }
                        }
                        .cornerRadius(10)
                        .frame(height: 53, alignment: .center)
                        .padding(.top, 45)
                        Spacer()
                    }
                    .padding(.horizontal, 40)
                }
            }
            
        }
    }
}

extension RegistrationView {
    var form: some View {
        VStack(spacing: 19) {
            HStack(spacing: 11) {
                Image("Login")
                    .frame(width: 21, height: 25, alignment: .center)
                TextField("", text: $viewModel.username)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.username.isEmpty, placeholder: {
                        Text("Имя")
                            .foregroundColor(.gray)
                    })
                    .frame(height: 56, alignment: .center)
                    .accentColor(.blue)
            }
            .padding(.horizontal, 11)
            .frame(height: 46)
            .background(Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 3,
                    x: 0,
                    y: 0
                ))
            
            HStack(spacing: 11) {
                Image("Mail")
                    .frame(width: 21, height: 25, alignment: .center)
                TextField("", text: $viewModel.email)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.email.isEmpty, placeholder: {
                        Text("email")
                            .foregroundColor(.gray)
                    })
                    .frame(height: 56, alignment: .center)
                    .accentColor(.blue)
            }
            .padding(.horizontal, 11)
            .frame(height: 46)
            .background(Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 3,
                    x: 0,
                    y: 0
                ))
            
            HStack(spacing: 11) {
                Image("Password")
                    .frame(width: 21, height: 25, alignment: .center)
                TextField("", text: $viewModel.password)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.password.isEmpty, placeholder: {
                        Text("Пароль")
                            .foregroundColor(.gray)
                    })
                    .frame(height: 56, alignment: .center)
                    .accentColor(.blue)
            }
            .padding(.horizontal, 11)
            .frame(height: 46)
            .background(Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 3,
                    x: 0,
                    y: 0
                ))
            
            HStack(spacing: 11) {
                Image("Password")
                    .frame(width: 21, height: 25, alignment: .center)
                TextField("", text: $viewModel.confirmPassword)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.confirmPassword.isEmpty, placeholder: {
                        Text("Повторите пароль")
                            .foregroundColor(.gray)
                    })
                    .frame(height: 56, alignment: .center)
                    .accentColor(.blue)
            }
            .padding(.horizontal, 11)
            .frame(height: 46)
            .background(Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 3,
                    x: 0,
                    y: 0
                ))
        }
    }
}

extension RegistrationView {
    var header: some View {
        HStack {
            Image("ChevronLeft")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32, alignment: .center)
                .padding(.horizontal, 17)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
            Spacer()
        }
    }
}
