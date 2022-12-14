//
//  AuthorizationView+LoginView.swift
//  Karma
//
//  Created by efvo on 11.12.2022.
//

import SwiftUI

extension AuthorizationView {
    var loginPassView: some View {
        VStack(spacing: 28)  {
            HStack {
                TextField("", text: $viewModel.username)
                    .autocapitalization(.none)
                    .padding(10)
                    .placeholder(when: viewModel.username.isEmpty, placeholder: {
                        Text("Логин")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: .zero,
                                                leading: 16,
                                                bottom: .zero,
                                                trailing: 16))
                    })
                    .frame(height: 56, alignment: .center)
                    .accentColor(.white)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            HStack {
                SecureField("", text: $viewModel.password)
                    .autocapitalization(.none)
                    .padding(10)
                    .placeholder(when: viewModel.password.isEmpty, placeholder: {
                        Text("Пароль")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: .zero,
                                                leading: 16,
                                                bottom: .zero,
                                                trailing: 16))
                    })
                    .frame(height: 56, alignment: .center)
                    .accentColor(.white)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}
