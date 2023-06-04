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
            horizontalCategoriesView
                .padding(.horizontal, 40)
            ScrollView {
                LazyVStack(spacing: 30) {
                    ForEach(viewModel.filteredList) { items in
                        MainViewCell(
                            categoryImageName: "animalsIcon",
                            orgName: "Batumi dog house",
                            orgLocation: "Батуми, Грузия",
                            orgDescription: "Организация занимаеться сбором средств для приютов и прочей деятельностью связанной с защитой животных.")
                            .onTapGesture {
                                showDetails.toggle()
                            }
                    }
                }
                .padding(.horizontal, 30)
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
//                categoryViewModel.categories.filter { $0.isSelect }
            },
            content: {
                CategoriesView(viewModel: categoryViewModel)
            }
        )
    }
    
    var horizontalCategoriesView: some View {
        HStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    let categories = categoryViewModel.categories.filter { $0.isSelect }
                    ForEach(categories, id: \.self) { value in
                        HStack {
                            Text(value.type.title)
                                .font(.regular(12))
                            Image("cancel")
                                .resizable()
                                .frame(width: 12, height: 12, alignment: .center)
                                .onTapGesture {
                                }
                        }
                        .frame(height: 32, alignment: .center)
                        .padding(.horizontal, 10)
                        .background(RoundedRectangle(cornerRadius: 16).stroke(Color.primaryAction, lineWidth: 1))
                    }
                }
                .padding(.vertical, 1)
            }
        }
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel(), categoryViewModel: .init())
    }
}
