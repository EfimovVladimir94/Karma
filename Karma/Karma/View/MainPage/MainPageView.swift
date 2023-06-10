//
//  MainPageView.swift
//  Karma
//
//  Created by efvo on 15.12.2022.
//

import SwiftUI

struct MainPageView: View {
    
    public let router: NavigationView
    @State var index = 0
    
    init(router: NavigationView) {
        self.router = router
    }
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack {
                Spacer()
                switch index {
                case 0 :
                    MainView()
                case 1 :
                    ProfileView(viewModel: .init(router: router))
                case 2 :
                    KarmaBonusView()
                case 3 :
                    NewsView()
                default:
                    ZStack {Color.red}
                }
            }
            VStack {
                Spacer()
                barButtonView
            }
            .ignoresSafeArea()
        }
    }
    
    var barButtonView: some View {
        ZStack {
            VStack {
                HStack(spacing: 30) {
                    Button(action: {
                        index = 0
                    }, label: {
                        VStack {
                            Image("Favorites")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(index == 0 ? .blue : .gray)
                                .frame(
                                    width: 25,
                                    height: 25,
                                    alignment: .center
                                )
                            Text("Главная")
                                .font(.bold(10))
                                .accentColor(index == 0 ? .blue : .gray)
                        }
                    })
                    Button(action: {
                        index = 1
                    }, label: {
                        VStack {
                            Image("Profile")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(index == 1 ? .blue : .gray)
                                .frame(
                                    width: 25,
                                    height: 25,
                                    alignment: .center
                                )
                            Text("Профиль")
                                .font(.bold(10))
                                .accentColor(index == 1 ? .blue : .gray)
                        }
                    })
                    Button(action: {
                        index = 2
                    }, label: {
                        VStack {
                            Image("Karma")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(index == 2 ? .blue : .gray)
                                .frame(
                                    width: 25,
                                    height: 25,
                                    alignment: .center
                                )
                            Text("Карма")
                                .font(.bold(10))
                                .accentColor(index == 2 ? .blue : .gray)
                        }
                    })
                    Button(action: {
                        index = 3
                    }, label: {
                        VStack {
                            Image("news")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(index == 3 ? .blue : .gray)
                                .frame(
                                    width: 25,
                                    height: 25,
                                    alignment: .center
                                )
                            Text("Новости")
                                .font(.bold(10))
                                .accentColor(index == 3 ? .blue : .gray)
                        }
                    })
                }
            }
            .padding(.top, 16)
        }
        .frame(width: UIScreen.main.bounds.width, height: 80, alignment: .top)
        .background(
            Color.white
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .shadow(
                    color: Color.gray.opacity(0.5),
                    radius: 2,
                    x: 0,
                    y: 0
                )
        )
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(router: .init(withState: .mainView))
    }
}
