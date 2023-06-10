//
//  PaymentMethodView.swift
//  Karma
//
//  Created by Vladimir on 08.06.23.
//

import SwiftUI

struct PaymentMethodView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: PaymentViewModel
    @State var showLinkNewCard = false
    var body: some View {
        VStack(spacing: 0) {
            HeaderModalView()
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("Способ оплаты")
                        .font(.semibold(20))
                        .foregroundColor(.black)
                    
                }
                Divider()
                    .padding(.top, 11)
                ForEach(viewModel.paymentMethodTypes) { item in
                    SelectedCell(
                        text: item.type.value,
                        iconName: item.iconName,
                        isSelected: item.isSelected
                    ) {
                        if item.type == .newCard {
                            showLinkNewCard.toggle()
                        }
                        viewModel.selectMethod(method: item)
                    }
                }
                .padding(.top, 21)
            }
            .padding(.horizontal, 21)
            Spacer()
        }
        .sheet(isPresented: $showLinkNewCard) {
            NewCardView()
        }
       
    }
}

struct PaymentMethodView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentMethodView(viewModel: .init())
    }
}
