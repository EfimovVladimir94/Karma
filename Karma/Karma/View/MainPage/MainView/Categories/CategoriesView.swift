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
                VStack {
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
                    .padding(.leading, 34)
                Spacer()
                Image("Cancel")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .padding(.horizontal, 12)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
        }
    }
    
    var content: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(80), spacing: 35), count: 3),
                      alignment: .center,
                      spacing: 33) {
                ForEach(Array(viewModel.categories.enumerated()), id: \.offset) { item in
                    VStack {
                        ZStack {
                            Color.red
                        }
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                        Text(item.element)
                    }
                }
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView(viewModel: .init())
    }
}
