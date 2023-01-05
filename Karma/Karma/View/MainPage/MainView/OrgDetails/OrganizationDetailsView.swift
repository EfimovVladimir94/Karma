//
//  OrganizationDetailsView.swift
//  Karma
//
//  Created by efvo on 05.01.2023.
//

import SwiftUI

struct OrganizationDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            header
            shortDesc
            Spacer()
        }
    }
    
    var header: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            HStack {
                Image("ChevronLeft")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20, alignment: .leading)
                    .padding(.horizontal, 15)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Image("Favorites")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20, alignment: .leading)
                    .padding(.horizontal, 20)
                
            }
            Text("Тип Организации")
                .frame(alignment: .center)
                .foregroundColor(.white)
                .font(.medium(18))
        }
        .frame(height: 56)
        .frame(maxWidth: .infinity)
    }
    
    var shortDesc: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
                .frame(width: 170, height: 101, alignment: .center)
            Text("Краткое описание")
                .frame(alignment: .center)
                .foregroundColor(.white)
                .font(.medium(18))
        }
        .background(Color.blue.frame(width: UIScreen.main.bounds.width))
    }
}


struct OrganizationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationDetailsView()
    }
}
