//
//  RegisterGeolocationView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 07/09/25.
//

import SwiftUI

struct RegisterGeolocationView: View {
    @ObservedObject var recordDraft: RecordDraft
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.light2)
                .cornerRadius(12)
            
            if recordDraft.geolocation == nil {
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
            } else {
                ScrollView{
                    VStack(spacing: 20){
                        VStack(alignment: .leading, spacing: 8) {
                            Text(recordDraft.geolocation?.title ?? "Localização sem título")
                                .font(.system(size: 17))
                                .foregroundStyle(.blueDark2)
                            HStack{
                                Text("\(Image(systemName: "mappin.bubble"))")
                                    .font(.system(size: 15))
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                            }
                        }
                        Divider()
                            .padding(.horizontal, 12)
                            .padding(.vertical, 24)
                    }
                    Spacer()
                }
            }
        }
        
        VStack {
            Spacer()
            
            NavigationLink {
                GeolocalizationView(coordinates: "", recordDraft: recordDraft)
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
