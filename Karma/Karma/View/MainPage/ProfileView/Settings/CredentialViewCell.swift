//
//  SettingsViewCell.swift
//  Karma
//
//  Created by user on 02.01.2023.
//

import SwiftUI

enum CredentialTypes {
    case name, phone, email
    
    var title: String {
        switch self {
        case .name:
            return "Имя"
        case .phone:
            return "Телефон"
        case .email:
            return "Email"
        }
    }
}

struct CredentialViewCell: View {
    
    @State var type: CredentialTypes
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(type.title)
                .font(.medium(13))
                .foregroundColor(Color.gray)
            TextField("", text: $text)
                .autocapitalization(.none)
                .frame(height: 17, alignment: .center)
                .accentColor(.black)
                .foregroundColor(Color.black)
            Divider()
                .padding(.top, 10)
        }
    }
}
