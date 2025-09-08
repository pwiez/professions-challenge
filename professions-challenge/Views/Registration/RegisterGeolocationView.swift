//
//  RegisterGeolocationView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 07/09/25.
//

import SwiftUI

struct RegisterGeolocationView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.light2)
                .cornerRadius(12)
            
            VStack (spacing: 8) {
                Text("Nenhuma localização adicionada ainda.")
                    .font(.system(size: 28, weight: .bold))
                    .kerning(0.38)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blueDark2)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                Text("Toque em “\(Image(systemName: "pin.fill")) Adicionar Localização” para começar.")
                    .font(.system(size: 17, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blueDark2)
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(.horizontal, 12)
            
            VStack {
                Spacer()
                
                NavigationLink {
                    GeolocalizationView(coordinates: "")
                } label: {
                    Text("\(Image(systemName: "pin.fill")) Adicionar Localização")
                        .font(.system(size: 17))
                        .foregroundStyle(.light)
                        .frame(maxWidth: 230)
                        .frame(height: 50)
                        .background{
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.clay)
                        }
                        .padding(16)
                        .padding(.bottom, 21)
                }
            }
        }
    }
}

#Preview {
    RegisterGeolocationView()
}
