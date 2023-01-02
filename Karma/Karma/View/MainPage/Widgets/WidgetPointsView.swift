//
//  WidgetPointsView.swift
//  Karma
//
//  Created by efvo on 02.01.2023.
//

import SwiftUI

struct WidgetPointsView: View {
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack (alignment: .leading) {
                        Text("Очков кармы")
                            .font(.medium(17))
                        Text("154")
                            .font(.medium(25))
                    }
                    .padding(.top, 8)
                    Spacer()
                    Image("Hint")
                        .frame(width: 16, height: 16)
                }
                Text("Нажмите, чтобы потратить")
                    .font(.medium(13))
                    .foregroundColor(.gray)
                    .padding(.top)
            }
            .padding(.horizontal, 27)
            .padding(.vertical, 9)
        }
    }
}
