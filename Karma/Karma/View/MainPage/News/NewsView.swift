//
//  NewsView.swift
//  Karma
//
//  Created by Vladimir on 10.06.23.
//

import SwiftUI

struct NewsView: View {
    @ObservedObject var viewModel = NewsViewModel()
    var news = 5
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Новости")
                    .font(.semibold(30))
                    .foregroundColor(.black)
                    .padding(.top, 13)
                Spacer()
            }
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.news) { item in
                        NewsItemViewCell(item: item)
                    }
                }
                .padding(.top, 25)
                .padding(.bottom, 50)
            }
            Spacer()
        }
        .padding(.horizontal, 10)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
