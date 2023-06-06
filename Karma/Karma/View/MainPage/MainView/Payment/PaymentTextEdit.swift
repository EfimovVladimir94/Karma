//
//  PaymentTextEdit.swift
//  Karma
//
//  Created by Vladimir on 06.06.23.
//

import SwiftUI

struct PaymentTextEdit: View {
    @Binding var text: String
    var placeholder: String = "0₾"
    
    var body: some View {
        HStack {
            TextField("", text: $text)
                .autocapitalization(.none)
                .keyboardType(.numberPad)
                .placeholder(when: text.isEmpty, placeholder: {
                    HStack {
                        Spacer()
                        Text(placeholder)
                            .font(.medium(25))
                            .foregroundColor(.black)
                        Spacer()
                    }
                })
                .font(.medium(25))
                .foregroundColor(Color.black)
                .accentColor(.black)
        }
        .frame(height: 50)
        .background(Color.lightGray)
        .cornerRadius(10)
    }
}

struct PaymentTextEdit_Previews: PreviewProvider {
    static var previews: some View {
        PaymentTextEdit(text: .constant(""))
    }
}
