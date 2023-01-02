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
    @State var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(type.title)
                .font(.medium(13))
                .foregroundColor(Color.gray)
            Text(text)
                .font(.medium(17))
            Divider()
                .padding(.top, 6)
        }
        .padding(.top, 13)
    }
}
