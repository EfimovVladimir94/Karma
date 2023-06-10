//
//  KarmaBonusCell.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import SwiftUI

struct KarmaBonusCell: View {
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(alignment: .top) {
                    Image("azri")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(.leading, 10)
                    Text("AZRI - школа грузинского языка")
                        .font(.regular(15))
                        .foregroundColor(.black)
                }
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.lightGray)
                        .frame(height: 200)
                        .padding(.top, 17)
                    Text("То что они дают в качестве бонуса можно будет расписать в 3 строчках")
                        .font(.regular(15))
                        .foregroundColor(.black)
                    HStack(spacing: 0) {
                        Text("50")
                            .font(.regular(20))
                            .foregroundColor(.black)
                        Image("karmalogo")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 19, height: 14)
                            .padding(.leading, 5)
                    }
                    SubmitButton(title: "Выбрать", height: 33) {
                        
                    }
                    .padding(.horizontal, 72)
                }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 25)
        }
        .background(RoundedRectangle(cornerRadius: 20)
            .foregroundColor(.white))
        .frame(width: 300)
    }
}

struct KarmaBonusCell_Previews: PreviewProvider {
    static var previews: some View {
        KarmaBonusCell()
    }
}
