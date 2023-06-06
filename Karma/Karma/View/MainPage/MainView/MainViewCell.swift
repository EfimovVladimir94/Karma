//
//  MainViewCell.swift
//  Karma
//
//  Created by efvo on 15.12.2022.
//

import SwiftUI

struct MainViewCell: View {
    var categoryImageName: String
    var orgName: String
    var orgLocation: String
    var orgDescription: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(spacing: 0) {
                HStack {
                    Image("testImage1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(orgName)
                            .font(.regular(20))
                            .foregroundColor(Color.black)
                        Text(orgLocation)
                            .font(.regular(10))
                            .foregroundColor(Color.black)
                    }
                    Spacer()
                }
                .padding(.top, 18)
                
                Text(orgDescription)
                    .font(.regular(10))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 6)
                
                HStack(spacing: 15) {
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.primaryAction)
                            Text("Пожертвовать фонду")
                                .font(.bold(9))
                                .foregroundColor(Color.white)
                                .padding(5)
                        }
                    }
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.primaryAction, lineWidth: 1)
                            Text("Подробнее")
                                .font(.bold(9))
                                .foregroundColor(Color.primaryAction)
                                .padding(5)
                        }
                    }
                }
                .frame(height: 25)
                .padding(.vertical, 15)
            }
            .padding(.leading, 20)
            HStack {
                Image(categoryImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            }
            .padding(5)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.lightGray, lineWidth: 1)
        )
    }
}

struct MainViewCell_Previews: PreviewProvider {
    static var previews: some View {
        MainViewCell(
            categoryImageName: "animalsIcon",
            orgName: "Batumi dog house",
            orgLocation: "Батуми, Грузия",
            orgDescription: "Организация занимаеться сбором средств для приютов" +
            " и прочей деятельностью связанной с защитой животных."
        )
        .frame(height: 200)
    }
}
