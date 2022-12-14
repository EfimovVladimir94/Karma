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
                Spacer()
                Image("LaunchLogo")
                    .frame(width: 227, height: 157, alignment: .center)
                    .padding(.bottom, 34)
                loginPassView
                    .padding(.bottom, 18)
                Text("Регистрация")
                    .foregroundColor(.black)
                    .font(.bold(20))
                    .padding(.bottom, 7)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Авторизироваться через соц. сети")
                    .foregroundColor(.black)
                    .font(.medium(13))
                    .padding(.bottom, 7)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack(spacing: 15) {
                    Image("Instagram")
                        .frame(width: 42, height: 42, alignment: .center)
                        .background(Circle.init().foregroundColor(.blue))
                        .onTapGesture {
                        }
                    Image("Instagram")
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
                .padding(.bottom, 70)
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
            }
            .padding(.horizontal, 52)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView(viewModel: AuthorizationViewModel())
    }
}
