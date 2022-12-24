//
//  MainViewCell.swift
//  Karma
//
//  Created by efvo on 15.12.2022.
//

import SwiftUI

struct MainViewCell: View {
    var title: String
    var text: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Image("LabelOrg")
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                    .padding(.trailing, 40)
                    .padding(.vertical, 20)
            }
            .background(Color.blue)
            .cornerRadius(40, corners: [.topRight,.bottomRight])
            .padding(.top, 21)
            .zIndex(10)
            
            content
        }
    }
    
    var content: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.bold(25))
                        .foregroundColor(Color.black)
                    Text(text)
                        .font(.medium(16))
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.leading)
                }
                .padding(.leading, 50)
            }
            .frame(width: UIScreen.main.bounds.width - 100, height: 200, alignment: .top)
            .padding(.vertical, 10)
            .background(Rectangle()
                .fill(Color.white)
                .cornerRadius(21)
                .shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 5,
                    x: 0,
                    y: 0
                ))
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct MainViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCell(title: "", text: "")
    }
}
