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
    var fontSize: CGFloat = 17
    var height: CGFloat = 50
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
                        .font(.bold(fontSize))
                        .foregroundColor(isInvertStyle ? .primaryAction : .white)
                }
            }
            .frame(height: height)
        }
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(title: "Главная страница", isInvertStyle: true, submit: {})
    }
}
