//
//  WidgetPointsView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI

struct WidgetPointsView: View {
    @State var showOnboarding = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack (alignment: .leading) {
                        Text("Очков кармы")
                            .font(.medium(17))
                            .foregroundColor(.black)
                        Text("154")
                            .font(.medium(25))
                            .foregroundColor(.black)
                    }
                    .padding(.top, 8)
                    Spacer()
                    Image("stackcoins")
                        .resizable()
                        .frame(width: 115, height: 115)
                    Image("Hint")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .onTapGesture {
                            
                        }
                }
                Text("Узнать подробнее")
                    .font(.medium(13))
                    .foregroundColor(.gray)
                    .onTapGesture {
                        showOnboarding.toggle()
                    }
            }
            .padding(.horizontal, 27)
            .padding(.vertical, 9)
        }
        .sheet(isPresented: $showOnboarding) {
            OnboardingView(viewModel: .init())
        }
    }
}

struct WidgetPointsView_Previews: PreviewProvider {
    static var previews: some View {
        WidgetPointsView()
    }
}
