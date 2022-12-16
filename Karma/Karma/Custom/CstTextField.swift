//
//  CstTextField.swift
//  Karma
//
//  Created by efvo on 15.12.2022.
//

import SwiftUI

struct CstTextField: View {
    @Binding var text: String
    var imageName: String = ""
    var placeholder: String = ""
    
    var body: some View {
        HStack(spacing: 11) {
            Image(imageName)
                .frame(width: 21, height: 25)
                .foregroundColor(.blue)
                .padding(.leading, 11)
            TextField("", text: $text)
                .autocapitalization(.none)
                .placeholder(when: text.isEmpty, placeholder: {
                    Text(placeholder)
                        .foregroundColor(.gray)
                })
                .frame(height: 56, alignment: .center)
                .accentColor(.blue)
        }
        .frame(height: 46)
        .background(Rectangle()
            .fill(Color.white)
            .cornerRadius(10)
            .shadow(
                color: Color.gray.opacity(0.7),
                radius: 2,
                x: 0,
                y: 0
            ))
    }
}

struct CstTextField_Previews: PreviewProvider {
    static var previews: some View {
        CstTextField(
            text: .constant(""),
            imageName: "Search",
            placeholder: "Поиск..."
        )
    }
}
