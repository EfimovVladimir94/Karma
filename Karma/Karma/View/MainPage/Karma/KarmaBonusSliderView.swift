//
//  KarmaBonusSliderView.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import SwiftUI

struct KarmaBonusSliderView: View {
    
    @State var bonuses: [Bonus] = [.init(id: 0, title: "AZRI - школа грузинского языка", description: "То что они дают в качестве бонуса можно будет расписать в 3 строчках", price: 50),
                                   .init(id: 1, title: "AZRI - школа грузинского языка", description: "То что они дают в качестве бонуса можно будет расписать в 3 строчках", price: 50),
                                   .init(id: 2, title: "AZRI - школа грузинского языка", description: "То что они дают в качестве бонуса можно будет расписать в 3 строчках", price: 50)]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(bonuses) { item in
                    KarmaBonusCell()
                }
            }
            .padding(.leading, 45)
        }
    }
}

struct KarmaBonusSliderView_Previews: PreviewProvider {
    static var previews: some View {
        KarmaBonusSliderView()
    }
}
