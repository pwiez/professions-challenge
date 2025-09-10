//
//  GeolocalizationView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 01/09/25.
//

import SwiftUI
import CoreLocation

struct GeolocalizationView: View {
    @StateObject private var viewModel = MapsViewModel()
    @Environment(\.dismiss) private var dismiss
    
    @State var shouldShowManualLocationSheet: Bool = false
    @State var coordinates: String
    
    @ObservedObject var recordDraft: RecordDraft
    
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
                            recordDraft.geolocation = MapMarkerModel(position: CLLocationCoordinate2D(latitude: viewModel.cameraPositionLatitude, longitude: viewModel.cameraPositionLongitude), title: viewModel.utmString, snippet: "")
                            dismiss()
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
                
                .sheet(isPresented: $shouldShowManualLocationSheet) {
                    ManualCoordinatesInputView(
                        shouldShowManualLocationSheet: $shouldShowManualLocationSheet,
                        coordinates: $coordinates
                    )
                    .padding(.top, 16)
                    .presentationDetents([.fraction(0.35)])
                    .presentationDragIndicator(.visible)
                    .presentationBackground(.light2)
                }
                
                
                VStack{
                    Button {
                        viewModel.updateUTMCoordinates()
                        shouldShowManualLocationSheet = true
                    } label: {
                        Rectangle()
                            .frame(width: 235, height: 50)
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
                            .padding(.top, 24)
                    }
                }
                .offset(y: -57)
            }
            .ignoresSafeArea(edges: .all)
        }
        .navigationBarBackButtonHidden(false)
        .toolbarBackground(.light, for: .navigationBar)
    }
}
