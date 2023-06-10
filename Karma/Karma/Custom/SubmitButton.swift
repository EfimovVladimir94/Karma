//
//  SubmitButton.swift
//  Karma
//
//  Created by Vladimir on 06.06.23.
//

import SwiftUI

struct SubmitButton: View {
    var title = ""
    var isInvertStyle = false
    var submit: (() -> ())
    var body: some View {
        HStack {
            Button {
                submit()
            } label: {
                ZStack {
                    if isInvertStyle {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primaryAction, lineWidth: 1)
                    } else {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.primaryAction)
                    }
                    
                    Text(title)
                        .font(.bold(17))
                        .foregroundColor(isInvertStyle ? .primaryAction : .white)
                }
            }
            .frame(height: 50)
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(title: "Главная страница", isInvertStyle: true, submit: {})
    }
}
