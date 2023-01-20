//
//  FloatingTabbar.swift
//  Karma
//
//  Created by efvo on 20.01.23.
//

import SwiftUI

struct TabbarButton: View {
    
//    @Binding var selected : Int
//    var numberSelected: Int
    var type: TabBarButtonType
    
    var body: some View {
//        Button(action: {
//            self.selected = numberSelected
//        }) {
//            VStack {
//                Image(systemName: image)
//                    .foregroundColor(self.selected == numberSelected ? .blue : .gray)
//            }
//        }
        Button(action: {
//            withAnimation {
//                index = 3
//            }
        }, label: {
            VStack {
                Image(type.iconName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor( .gray)
                    .frame(
                        width: 25,
                        height: 25,
                        alignment: .center
                    )
                Text(type.title)
                    .font(.bold(10))
                    .accentColor(.gray)
            }
        })
    }
}

struct FloatingTabbar : View {
    
    @Binding var selected : Int
    @State var expand = false
    let tabs: [TabBarButtonType] = [.main, .profile, .karma, .news]
    
    @State var angle = 90.0
    
    var body : some View {
        
        HStack {
            Spacer()
            HStack {
                if !self.expand {
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                            .padding()
                            .rotationEffect(
                                Angle.degrees(angle))
                    }
                } else {
                    ForEach(tabs, id: \.self) { element in
                        TabbarButton(type: element)
                        Spacer()
                    }
                    Spacer()
                    Button(action: {
                        self.expand.toggle()
                    }) {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 20))
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding(.vertical,self.expand ? 10 : 8)
            .padding(.horizontal,self.expand ? 35 : 4)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 80))
            .padding(15)
            .shadow(color: .secondary, radius: 2, x: 2, y: 2)
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.0))
        }
    }
}

enum TabBarButtonType {
    case main, profile, karma, news
    
    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .profile:
            return "Профиль"
        case .karma:
            return "Карма"
        case .news:
            return "Новости"
        }
    }
    
    var iconName: String {
        switch self {
        case .main:
            return "Favorites"
        case .profile:
            return "Profile"
        case .karma:
            return "Karma"
        case .news:
            return "BurgerMenu"
        }
    }
}
