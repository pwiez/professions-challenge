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
                            Image(systemName: "location.fill")
                                .font(.title)
                        }
                        .padding()
                    }
                }
                Button {
                    viewModel.updateUTMCoordinates()
                } label: {
                    Rectangle()
                        //.offset(y: -100)
                        .frame(width: 100, height: 40)
                        .overlay(
                            Text(viewModel.utmString)
                                .foregroundStyle(.white)
                                .font(.caption)
                        )
                }
                
                Image(systemName: "mappin")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .offset(y:-24)
            }
            .navigationTitle("Geolocalização")
            
           
        }
    }
}

#Preview {
    GeolocalizationView()
}
