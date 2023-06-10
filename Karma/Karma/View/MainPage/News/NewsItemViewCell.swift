//
//  PresentItemViewCell.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import SwiftUI

struct NewsItemViewCell: View {
    var item: News
    var completion: (()->())?
    
    var body: some View {
        HStack {
            HStack(spacing: 16) {
                Image(item.imageUrl)
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading, spacing: 10) {
                    Text(item.title)
                        .font(.medium(17))
                        .foregroundColor(.black)
                    Text(item.description)
                        .font(.regular(10))
                        .foregroundColor(.black)
                        SubmitButton(
                            title: "Подробнее",
                            fontSize: 10,
                            height: 25
                        ) {
                            completion?()
                        }
                        .padding(.trailing, 70)
                }
            }
            .padding(16)
            .modifier(WidgetModifier())
            .frame(height: 150)
        }
        .padding(.horizontal, 5)
    }
}

struct NewsItemViewCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsItemViewCell(item: .init(id: 0, title: "Название статьи", description: "Приложение KARMA позволяет пользователям сделать пожертвования в деньгах или вещах напрямую через приложение. Это означает, что пользователи могут легко и удобно поделиться своими ресурсами с теми, кто нуждается в помощи, не выходя из дома.", imageUrl: "testnews1"))
    }
}
