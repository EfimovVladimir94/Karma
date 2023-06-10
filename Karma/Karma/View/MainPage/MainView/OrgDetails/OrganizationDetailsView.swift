//
//  OrganizationDetailsView.swift
//  Karma
//
//  Created by efvo on 05.01.2023.
//

import SwiftUI

struct OrganizationDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var showFull = false
    @State var showPayment = false
    
    var body: some View {
        VStack(spacing: 0) {
            header
            logoView
            content
        }
    }
}


struct OrganizationDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        OrganizationDetailsView()
    }
}

extension OrganizationDetailsView {
    
    var content: some View {
        ScrollView {
            VStack(spacing: 0) {
                aboutProject
                certs
                helpers
                SubmitButton(title: "Пожертвовать фонду") {
                    showPayment.toggle()
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 29)
        }
        .sheet(isPresented: $showPayment) {
            PaymentView()
        }
    }
    
    
    var header: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            HStack {
                Image("ChevronLeft")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20, alignment: .leading)
                    .padding(.horizontal, 15)
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                Spacer()
                Image("Favorites")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 20, height: 20, alignment: .leading)
                    .padding(.horizontal, 20)
                
            }
            Text("Тип Организации")
                .frame(alignment: .center)
                .foregroundColor(.white)
                .font(.medium(18))
        }
        .frame(height: 56)
        .frame(maxWidth: .infinity)
    }
    
    var logoView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
            Image("testImage1")
                .resizable()
                .scaledToFit()
                .frame(width: 110, height: 120)
        }
        .frame(height: 120)
        .padding(.horizontal, 95)
        .padding(.bottom, 14)
        .background(
            Color.blue
                .frame(width: UIScreen.main.bounds.width)
                .cornerRadius(30, corners: [.bottomLeft, .bottomRight]))
    }
    
    var aboutProject: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("О проекте")
                    .font(.semibold(20))
                    .foregroundColor(.black)
                Spacer()
            }
            
            Text("Организация \"Спасение животных\" была основана несколько лет назад с целью борьбы с жестокостью к животным, сохранения их жизней и обеспечения им заботы и любви. Она занимается помощью животным, которые попали в беду...")
                .lineLimit(showFull ? nil : 4)
                .font(.regular(15))
                .foregroundColor(.black)
                .padding(.top, 10)
            Text(showFull ? "Скрыть" : "Показать полностью")
                .font(.semibold(15))
                .kerning(1)
                .foregroundColor(.primaryAction)
                .padding(.top, 10)
                .onTapGesture {
                    showFull.toggle()
                }
        }
        .padding(.top, 25)
    }
    
    var certs: some View {
        VStack(spacing: 10) {
            HStack(spacing: 20) {
                Text("Сертификаты")
                    .font(.semibold(20))
                    .foregroundColor(.black)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    Image("testcert1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                    Image("testcert2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                    Image("testcert3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                }
            }
        }
        .padding(.top, 20)
    }
    
    var helpers: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Помогают фонду")
                    .font(.semibold(20))
                    .foregroundColor(.black)
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    Image("testhelpers1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                    Image("testhelpers2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                    Image("testhelpers3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                    Image("testhelpers4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                }
            }
        }
        .padding(.top, 20)
    }
}
