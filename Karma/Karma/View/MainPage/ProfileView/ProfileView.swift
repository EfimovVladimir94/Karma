//
//  ProfileView.swift
//  Karma
//
//  Created by efvo on 26.12.2022.
//

import SwiftUI

struct ProfileView: View {
    @State var showSettings = false
    @State private var image = UIImage()
    @State private var showSheet = false
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 25) {
                header
                WidgetFactoryView(datasource: .init(amountLbl: "154", type: .points))
                WidgetFactoryView(datasource: .init(
                    amountLbl: "155",
                    type: .helped,
                    friends: viewModel.invitedFriends)
                )
                WidgetFactoryView(datasource: .init(type: .mySubscribers))
                WidgetFactoryView(datasource: .init(type: .achievements, achievements: viewModel.achievements))
            }
            .padding(.horizontal, 19)
            .padding(.bottom, 100)
        }
        .onAppear {
            viewModel.loadUserInfo()
        }
        .sheet(isPresented: $showSettings) {
            SettingsView(viewModel: viewModel)
        }
    }
    
    var header: some View {
        HStack(spacing: 9) {
            Image(uiImage: image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .background(Color.gray)
                .clipShape(Circle())
                .onTapGesture {
                    showSheet = true
                }
                .sheet(isPresented: $showSheet) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
            VStack(alignment: .leading, spacing: 5) {
                Text(viewModel.login)
                    .font(.medium(17))
                    .foregroundColor(.black)
                Text("Помогает с 2022 года.")
                    .font(.regular(13))
                    .foregroundColor(.black)
            }
            Spacer()
            Image("BurgerMenu")
                .frame(width: 40, height: 40)
                .onTapGesture {
                    showSettings.toggle()
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: .init(router: .init(withState: .mainView)))
    }
}
