//
//  ManualCoordinatesInputView.swift
//  professions-challenge
//
//  Created by Pedro Wiezel on 04/09/25.
//

import SwiftUI

struct ManualCoordinatesInputView: View {
    @Binding var shouldShowManualLocationSheet: Bool
    @Binding var coordinates: String
    
    var body: some View {
        VStack{
            HStack{
                Text("Coordenadas manuais")
                    .font(.system(size: 21))
                    .fontWeight(.semibold)
                    .foregroundStyle(.blueDark2)
                
                Spacer()
                Button {
                    shouldShowManualLocationSheet = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .frame(width: 30, height: 30, alignment: .center)
                        .foregroundStyle(.gray)
                }
                
            }
            .padding(.horizontal)
            .padding(.bottom)
            
            VStack (spacing: 0){
                HStack{
                    Text("Digite as coordenadas:")
                        .font(.system(size: 17))
                        .foregroundStyle(.blueDark2)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
                
                TextField("", text: $coordinates)
                    .padding(.horizontal, 10) // padding interno
                    .frame(maxWidth: .infinity, minHeight: 37, maxHeight: 37)
                    .background(.light)
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.12), radius: 2, x: -1, y: 3)
                    .padding(.horizontal)
            }
            .padding(.bottom, 8)
            
            Button{
                //TODO: implementar validação das coordenadas inseridas e atualizar a posição no mapa com elas
            }
            label: {
                Text("Salvar")
                    .font(.system(size: 17))
                    .foregroundStyle(.light)
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background{
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.clay)
                    }
                    .padding(16)
                    .padding(.bottom, 16)
            }
        }
    }
}

#Preview {
    ManualCoordinatesInputView(shouldShowManualLocationSheet: .constant(true), coordinates: .constant("") )
}
