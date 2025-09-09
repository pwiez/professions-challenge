//
//  OnboardingView1.swift
//  professions-challenge
//
//  Created by Livia Barbosa on 08/09/25.
//

import SwiftUI

struct OnboardingView1: View {
    var onFinish: () -> Void
    @State var selected = 0
    var body: some View {
        TabView(selection: $selected){
            ForEach(0..<4) { index in
                VStack{
                    HStack{
                        Spacer()
                        //Skip button
                        Button{
                            onFinish()
                        } label: {
                            Text(((index == 3) ? "Iniciar o Aplicativo": "Pular tutorial"))
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(Color(red: 0.28, green: 0.18, blue: 0.00)) // dark brown
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color(red: 1.0, green: 0.95, blue: 0.87)) // beige background
                                .cornerRadius(12)
                        }
                        .padding(.trailing, 20)
                        .padding(.top, 40)
                        .tag(index)
                    }
                    Spacer()
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Image("Onboarding\(selected)") // <-- Fixed string interpolation
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .animation(.linear, value: selected)
                //TODO: -arrumar essa transição
                .transition(.move(edge: .trailing))
        }
        .ignoresSafeArea(edges: .vertical)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

#Preview{
    HomeView(isOnboardingComplete: false)
}
