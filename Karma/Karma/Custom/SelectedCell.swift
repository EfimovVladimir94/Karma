//
//  SelectedCell.swift
//  Karma
//
//  Created by Vladimir on 06.06.23.
//

import SwiftUI

struct SelectedCell: View {
    var text = ""
    var placeholder = ""
    var iconName = ""
    var showArrow = false
    var isSelected = false
    var completion: (() -> ())
    
    var body: some View {
        Button {
            completion()
        } label: {
            VStack {
                HStack(spacing: 0) {
                    Image(iconName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35, height: 25)
                    Text(text.isEmpty ? placeholder : text)
                        .font(.medium(15))
                        .padding(.horizontal, 15)
                        .foregroundColor(placeholder.isEmpty ? .black : .gray)
                    Spacer()
                    if showArrow {
                        Image("ChevronRight")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 13, height: 22)
                    }
                    if isSelected {
                        Image("Check")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color.primaryAction)
                            .frame(width: 22, height: 22)
                    }
                    
                }
                Divider()
            }
        }
    }
}

struct SelectedCell_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCell(
            text: "Новая карта",
            placeholder: "",
            iconName: "card",
            showArrow: true,
            completion: {}
        )
    }
}
