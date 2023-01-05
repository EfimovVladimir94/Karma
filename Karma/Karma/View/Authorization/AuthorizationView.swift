//
//  ContentView.swift
//  Karma
//
//  Created by efvo on 05.12.2022.
//

import SwiftUI

struct AuthorizationView: View {
    @ObservedObject var viewModel: AuthorizationViewModel
    @State var showRegistration = false
    
    var body: some View {
        content
            .fullScreenCover(isPresented: $showRegistration) {
                RegistrationView(viewModel: RegistrationViewModel())
            }
            .fullScreenCover(isPresented: $viewModel.showMainPage) {
                MainPageView(router: viewModel.router)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView(viewModel: AuthorizationViewModel(router: NavigationView.init(withState: .authorization)))
    }
}
