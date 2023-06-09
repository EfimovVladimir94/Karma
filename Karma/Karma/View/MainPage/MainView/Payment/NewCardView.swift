//
//  NewCardView.swift
//  Karma
//
//  Created by Vladimir on 09.06.23.
//

import SwiftUI

struct NewCardView: View {
    var body: some View {
        ZStack {
            HeaderModalView().background(Color.red)
            VStack(spacing: 0) {
                Text("Способ оплаты")
                    .font(.medium(15))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                Spacer()
            }
            
        }
    }
}

struct NewCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewCardView()
    }
}
