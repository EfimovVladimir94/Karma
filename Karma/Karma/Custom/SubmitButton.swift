//
//  SubmitButton.swift
//  Karma
//
//  Created by Vladimir on 06.06.23.
//

import SwiftUI

struct SubmitButton: View {
    var submit: (() -> ())
    var body: some View {
        HStack {
            Button {
                submit()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.primaryAction)
                    Text("Пожертвовать фонду")
                        .font(.bold(17))
                        .foregroundColor(.white)
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
        SubmitButton(submit: {})
    }
}
