//
//  ProfileView.swift
//  Karma
//
//  Created by efvo on 26.12.2022.
//

import SwiftUI

struct ProfileView: View {
    @State var showSettings = false
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 25) {
                header
                WidgetFactoryView(datasource: .init(amountLbl: "154", type: .points))
                WidgetFactoryView(datasource: .init(amountLbl: "154", type: .helped))
                WidgetFactoryView(datasource: .init(amountLbl: "154", type: .achievements))
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 100)
        }
        .sheet(isPresented: $showSettings) {
            SettingsView(viewModel: viewModel)
        }
    }
    
    var header: some View {
        HStack {
            Image("Ellipse")
                .frame(width: 100, height: 100)
            VStack(alignment: .leading, spacing: 5) {
                Text("Ираклий")
                    .font(.medium(17))
                    .foregroundColor(.black)
                Text("Помогает с 2022 года.")
                    .font(.regular(13))
                    .foregroundColor(.black)
            }
            Image("Ellipse")
                .resizable()
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
