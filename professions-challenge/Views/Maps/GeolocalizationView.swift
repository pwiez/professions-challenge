//
//  GeolocalizationView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 01/09/25.
//

import SwiftUI

struct GeolocalizationView: View {
    @StateObject private var viewModel = MapsViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                MapsView(viewModel: viewModel)
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            viewModel.updateCurrentLocation()
                        } label: {
                            Circle()
                                .fill(Color.clay)
                                .frame(width: 64, height: 64)
                                .overlay(
                                    Image("locationIcon")
                                        .resizable()
                                        .frame(width: 32, height: 32)
                                    
                                )
                                .shadow(radius: 4)
                        }
                        .padding()
                        .padding(.bottom, 32)
                    }
                    
                    ZStack{
                        Rectangle()
                            .frame(maxWidth: .infinity, maxHeight: 120)
                            .foregroundStyle(.light2)
                        Button{
                        } label: {
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
                                .padding(.bottom, 21)
                        }
                    }
                }
                
                VStack{
                    Button {
                        viewModel.updateUTMCoordinates()
                    } label: {
                        Rectangle()
                            .frame(width: 225, height: 50)
                            .cornerRadius(12)
                            .foregroundStyle(.light2)
                            .overlay(
                                HStack{
                                    Text(viewModel.utmString)
                                        .foregroundStyle(.blueDark2)
                                        .font(.system(size: 14, weight: .medium))
                                        .lineLimit(1)
                                    Image(systemName: "chevron.down")
                                        .foregroundStyle(.blueDark2)
                                        .font(.system(size: 14, weight: .medium))
                                }
                            )
                    }
                    ZStack{
                        Image("mappin")
                            .foregroundStyle(.light)
                            .frame(width: 32, height: 32)
                        //.offset(y:-55)
                            .padding(.top, 24)
                    }
                }
                .offset(y: -55)
            }
            .ignoresSafeArea(edges: .all)
        }
        .navigationBarBackButtonHidden(false)
        .toolbarBackground(.light, for: .navigationBar)
    }
}

//#Preview {
//    GeolocalizationView()
//}
