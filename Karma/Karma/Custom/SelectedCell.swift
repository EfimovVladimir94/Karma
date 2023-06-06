//
//  SelectedCell.swift
//  Karma
//
//  Created by Vladimir on 06.06.23.
//

import SwiftUI

struct SelectedCell: View {
    @State var text = ""
    @State var placeholder = ""
    @State var iconName = ""
    @State var showArrow = false
    var completion: (() -> ())
    
    var body: some View {
        Button {
            completion()
        } label: {
            VStack {
                HStack(spacing: 0) {
                    Image(iconName)
                        .resizable()
                        .frame(width: 25, height: 17)
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
