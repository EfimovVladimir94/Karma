//
//  AuthorizationView+LoginView.swift
//  Karma
//
//  Created by efvo on 11.12.2022.
//

import SwiftUI

extension AuthorizationView {
    var loginPassView: some View {
        VStack(spacing: 14)  {
            HStack(spacing: 11) {
                Image("Login")
                    .frame(width: 21, height: 25)
                    .foregroundColor(.blue)
                    .padding(.leading, 11)
                TextField("", text: $viewModel.username)
                    .autocapitalization(.none)
                    .placeholder(when: viewModel.username.isEmpty, placeholder: {
                        Text("Логин")
                            .foregroundColor(.gray)
                    })
                    .frame(height: 56, alignment: .center)
                    .accentColor(.blue)
            }
            .background(Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 3,
                    x: 0,
                    y: 0
                ))
            HStack {
                HStack(spacing: 11) {
                    Image("Password")
                        .frame(width: 21, height: 25)
                        .foregroundColor(.blue)
                        .padding(.leading, 11)
                    SecureField("", text: $viewModel.password)
                        .autocapitalization(.none)
                        .placeholder(when: viewModel.password.isEmpty, placeholder: {
                            Text("Пароль")
                                .foregroundColor(.gray)
                        })
                        .frame(height: 56, alignment: .center)
                        .accentColor(.blue)
                }
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
}
