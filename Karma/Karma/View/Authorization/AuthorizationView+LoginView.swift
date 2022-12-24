//
//  AuthorizationView+LoginView.swift
//  Karma
//
//  Created by efvo on 11.12.2022.
//

import SwiftUI

extension AuthorizationView {
    var loginPassView: some View {
        VStack(alignment: .leading, spacing: 14)  {
            CstTextField(
                text: $viewModel.username,
                imageName: "Login",
                placeholder: "Логин"
            )
            if let error = viewModel.loginError {
                Text(error)
                    .foregroundColor(.red)
                    .font(.regular(10))
            }
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
                        .frame(height: 46, alignment: .center)
                        .accentColor(.blue)
                }
                .background(Rectangle()
                    .fill(Color.white)
                    .cornerRadius(10)
                    .shadow(
                        color: Color.gray.opacity(0.7),
                        radius: 2,
                        x: 0,
                        y: 0
                    ))
            }
            if let error = viewModel.passwordError {
                Text(error)
                    .foregroundColor(.red)
                    .font(.regular(10))
            }
        }
    }
}
