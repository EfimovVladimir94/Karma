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
            VStack {
                header
                VStack(spacing: 0) {
                    ScrollView {
                        VStack(spacing: 0) {
                            Image("LaunchLogo")
                                .frame(width: 227, height: 157, alignment: .center)
                                .padding(.top, 70)
                            form
                                .padding(.top, 21)
                            Button {
                                presentationMode.wrappedValue.dismiss()
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
}

extension RegistrationView {
    var form: some View {
        VStack(spacing: 19) {
            CstTextField(
                text: $viewModel.username,
                imageName: "Login",
                placeholder: "Имя"
            )
            CstTextField(
                text: $viewModel.email,
                imageName: "Mail",
                placeholder: "email"
            )
            CstTextField(
                text: $viewModel.password,
                imageName: "Password",
                placeholder: "Пароль"
            )
            CstTextField(
                text: $viewModel.confirmPassword,
                imageName: "Password",
                placeholder: "Повторите пароль"
            )
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

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(viewModel: RegistrationViewModel())
    }
}
