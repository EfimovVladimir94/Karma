//
//  HeaderModalView.swift
//  Karma
//
//  Created by Vladimir on 09.06.23.
//

import SwiftUI

struct HeaderModalView: View {
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        HStack {
            Spacer()
            Image("cancel")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(16)
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

struct HeaderModalView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderModalView()
    }
}
