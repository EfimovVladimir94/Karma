//
//  MainView.swift
//  Karma
//
//  Created by efvo on 15.12.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack {
            VStack {
                CstTextField(
                    text: $viewModel.username,
                    imageName: "Search",
                    placeholder: "Поиск..."
                )
            }
            .padding(.horizontal, 40)
            .padding(.top, 11)
            
            Button {
                //                viewModel.loginAction()
            } label: {
                HStack {
                    Text("Категории")
                        .font(.bold(25))
                        .foregroundColor(Color.black)
                    Spacer()
                    Image("ChevronRight")
                }
            }
            .padding(.horizontal, 54)
            ScrollView {
                VStack(spacing: 30) {
                    MainViewCell()
                        .padding(.top, 10)
                    MainViewCell()
                    MainViewCell()
                    MainViewCell()
                }
                .padding(.bottom, 50)
            }
            Spacer()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
