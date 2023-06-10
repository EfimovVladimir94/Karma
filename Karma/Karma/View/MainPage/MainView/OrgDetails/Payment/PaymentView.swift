//
//  PaymentView.swift
//  Karma
//
//  Created by Vladimir on 06.06.23.
//

import SwiftUI

struct PaymentView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var selectedSegmentIndex = 1
    @State var enteredPrice = ""
    @State var showMethods = false
    private let segments = ["10", "30", "50"]
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderModalView()
            content
        }
        .sheet(isPresented: $showMethods) {
            PaymentMethodView(viewModel: .init())
        }
    }
    
    var content: some View {
        VStack(spacing: 0) {
            Text("Пожертвовать Tbilisi Zoo found")
                .font(.medium(25))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 74)
            Text("Batumi, Georgia")
                .font(.regular(15))
                .foregroundColor(.black)
                .padding(.top, 15)
            
            VStack(alignment: .leading, spacing: 0) {
                PaymentTextEdit(text: $enteredPrice)
                    .padding(.top, 20)
                Text("Способ оплаты")
                    .font(.medium(15))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                SelectedCell(
                    placeholder: "Новая карта",
                    iconName: "card",
                    showArrow: true,
                    completion: {
                        showMethods.toggle()
                    }
                )
                .padding(.top, 10)
                segmentPrice
                SubmitButton(title: "Пожертвовать фонду") {
                }
                .padding(.top, 20)
                Spacer()
            }
            .padding(.horizontal, 45)
            Spacer()
        }
    }
    
    var segmentPrice: some View {
        HStack(spacing: 30) {
            ForEach(segments, id: \.self) { segment in
                Button(action: {
                    if let index = segments.firstIndex(of: segment) {
                        selectedSegmentIndex = index
                    }
                }) {
                    ZStack {
                        let isSelected = selectedSegmentIndex == segments.firstIndex(of: segment)
                        if isSelected {
                            RoundedRectangle(cornerRadius: 10)
                        } else {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primaryAction, lineWidth: 1)
                        }
                        Text("\(segment)₾")
                            .font(.semibold(15))
                            .frame(width: 80)
                            .foregroundColor(isSelected ? .white : .primaryAction)
                    }
                    
                }
            }
        }
        .frame(height: 30)
        .padding(.top, 20)
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView()
    }
}
