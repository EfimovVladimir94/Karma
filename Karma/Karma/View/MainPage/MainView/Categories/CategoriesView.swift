//
//  CategoriesView.swift
//  Karma
//
//
import SwiftUI

struct CategoriesView: View {
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject var viewModel: CategoriesViewModel
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            ZStack {
                Color.white
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .ignoresSafeArea()
                VStack(spacing: 0) {
                    header
                    content
                    Spacer()
                }
            }
            .padding(.top, 200)
        }
        .background(BackgroundClearView())
    }
    
    var header: some View {
        VStack {
            RoundedRectangle(cornerRadius: 2)
                .frame(width: 39, height: 3, alignment: .center)
                .foregroundColor(.gray)
                .padding(.top, 8)
            HStack(alignment: .top) {
                Text("Категории:")
                    .font(.medium(25))
                    .foregroundColor(Color.black)
                    .padding(.top, 20)
                    .padding(.leading, 13)
                Spacer()
                Image("cancel")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding(.horizontal, 12)
        }
    }
    
    var content: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(80), spacing: 35), count: 3),
                      alignment: .center,
                      spacing: 33) {
                ForEach(viewModel.categories) { item in
                    VStack {
                        ZStack {
                            RoundedCorner(radius: 10)
                                .foregroundColor(item.isSelect ? Color.primaryAction : Color.lightGray)
                            VStack(spacing: 2) {
                                Image("\(item.type)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 70)
                                    .padding(.bottom, item.type == .all ? 0 : 20)
                            }
                            .frame(width: 60, height: 70)
                        }
                        .frame(width: 80, height: 80)
                        .onTapGesture {
                            viewModel.selectedCategory = item
                        }
                        Text(item.type.title)
                            .lineLimit(1)
                            .font(.regular(9))
                    }
                }
            }
                      .padding(.top, 20)
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(viewModel: .init())
    }
}
