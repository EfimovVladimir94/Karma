//
//  OnboardingView.swift
//  Karma
//
//  Created by user on 13.12.2022.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    var completion: (()->())?
    @State var selection = 1
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    HStack {
                        Text("AZRI KARMA - платформа для благотворительности")
                            .font(.bold(20))
                            .foregroundColor(.white)
                            .padding([.top], 25)
                            .padding(.horizontal, 35)
                            .multilineTextAlignment(.center)
                    }
                    TabView(selection: $selection) {
                        Image("OnboardingLogo")
                            .resizable()
                            .scaledToFit()
                            .tag(1)
                        Image("OnboardEx1")
                            .resizable()
                            .scaledToFit()
                            .tag(2)
                        Image("OnboardEx2")
                            .resizable()
                            .scaledToFit()
                            .tag(3)
                        Image("OnboardingLogo")
                            .resizable()
                            .scaledToFit()
                            .tag(4)
                    }
                    .padding(.top, 30)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .indexViewStyle(.page(backgroundDisplayMode: .automatic))
                }
                .background(Ellipse()
                    .foregroundColor(.blue)
                    .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.height)
                    .padding(.top, -UIScreen.main.bounds.height/2))
                
                VStack(spacing: 0) {
                    pageControlView
                        .padding(.top, 20)
                        .frame(height: 50, alignment: .center)
                    Text(viewModel.data.descriprion)
                        .foregroundColor(.black)
                        .font(.regular(20))
                        .multilineTextAlignment(.center)
                        .padding(35)
                    Spacer()
                    Button {
                        completion?()
                    } label: {
                        ZStack {
                            Text("Пропустить")
                                .font(.bold(17))
                                .foregroundColor(Color.blue)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 70, height: 53)
                    .background(Rectangle()
                        .fill(Color.white)
                        .cornerRadius(10)
                        .shadow(
                            color: Color.gray.opacity(0.7),
                            radius: 2,
                            x: 0,
                            y: 0
                        ))
                }
                .padding(.bottom, 20)
            }
        }
        .onChange(of: selection, perform: { newValue in
            viewModel.selection = newValue
            viewModel.nextPage()
        })
        .background(Color.white.ignoresSafeArea())
    }
    
    var pageControlView: some View {
        HStack(alignment: .center, spacing: 10) {
            Circle()
                .frame(width: 10, height: 10, alignment: .center)
                .foregroundColor(selection == 1 ? .blue : .lightGray)
            Circle()
                .frame(width: 10, height: 10, alignment: .center)
                .foregroundColor(selection == 2 ? .blue : .lightGray)
            Circle()
                .frame(width: 10, height: 10, alignment: .center)
                .foregroundColor(selection == 3 ? .blue : .lightGray)
            Circle()
                .frame(width: 10, height: 10, alignment: .center)
                .foregroundColor(selection == 4 ? .blue : .lightGray)
        }
        .animation(.easeInOut, value: selection)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(viewModel: OnboardingViewModel())
    }
}
