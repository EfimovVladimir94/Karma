//
//  MainView.swift
//  Karma
//
//  Created by efvo on 15.12.2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    @ObservedObject var categoryViewModel = CategoriesViewModel()
    @State var showDetails = false
    @State var showCategories = false
    
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
            .onChange(of: viewModel.username) { newValue in
                viewModel.search(by: newValue)
            }
            
            Button {
                showCategories = true
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
                LazyVStack(spacing: 30) {
                    ForEach(viewModel.filteredList) { items in
                        MainViewCell(title: items.name, text: items.description)
                            .onTapGesture {
                                showDetails.toggle()
                            }
                    }
                }
                .padding(.bottom, 50)
                .padding(.top, 10)
            }
            Spacer()
        }
        .onAppear {
            viewModel.loadData()
//            KeychainManager().set("", forKey: Constants.Keys.token)
            
        }
        .fullScreenCover(isPresented: $showDetails) {
            OrganizationDetailsView()
        }
        .sheet(
            isPresented: $showCategories,
            onDismiss: {
//                print("xzxz \(categoryViewModel.categories.filter { $0.isSelect })")
            },
            content: {
                CategoriesView(viewModel: categoryViewModel)
            }
        )
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
