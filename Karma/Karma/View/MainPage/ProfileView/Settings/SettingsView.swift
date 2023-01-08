//
//  SettingsView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI

struct SettingsView: View {
    @State var enablePush = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 0) {
                    VStack {
                        HStack {
                            Text("Настройки")
                                .font(.medium(25))
                                .foregroundColor(.black)
                            Spacer()
                            Text("Готово")
                                .onTapGesture {
                                    viewModel.updateUserInfo()
                                    presentationMode.wrappedValue.dismiss()
                                }
                                .font(.bold(13))
                                .foregroundColor(.black)
                        }
                        .padding(.horizontal, 25)
                        VStack(spacing: 13) {
                            CredentialViewCell(type: .name, text: $viewModel.login)
                            CredentialViewCell(type: .phone, text: $viewModel.phone)
                            CredentialViewCell(type: .email, text: $viewModel.email)
                        }
                        .padding([.leading, .top], 25)
                    }
                    .padding(.top, 16)
                    
                    notifications
                        .padding(.horizontal, 20)
                        .padding(.top, 50)
                    
                    Button {
                        viewModel.logOut()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        ZStack {
                            Color.blue
                            Text("Выход")
                                .font(.bold(18))
                                .foregroundColor(Color.white)
                        }
                    }
                    .cornerRadius(10)
                    .frame(height: 53, alignment: .center)
                    .padding(.top, 50)
                    .padding(.horizontal, 45)
                    Spacer()
                }
            }
            .onAppear {
                viewModel.loadUserInfo()
            }
        }
    }
    
    var notifications: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Уведомления")
                    .font(.medium(17))
                    .foregroundColor(.black)
                Text("Push-уведомления о новостях проекта")
                    .font(.medium(13))
                    .foregroundColor(.black)
                    .padding(.top, 17)
                Text("Включить уведомления")
                    .font(.medium(13))
                    .foregroundColor(.black)
                    .foregroundColor(Color.gray)
            }
            .padding(.leading, 25)
            Toggle("", isOn: $enablePush)
                .padding(.trailing, 50)
        }
        .padding(.top, 14)
        .padding(.bottom)
        .modifier(WidgetModifier())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: .init(router: .init(withState: .mainView)))
    }
}
