//
//  MapsView.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 01/09/25.
//

import SwiftUI
import GoogleMaps
import CoreLocation

struct MapsView: UIViewRepresentable {
    @ObservedObject var viewModel: MapsViewModel
    
    func makeUIView(context: Context) -> GMSMapView {
        return viewModel.mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        uiView.animate(to: viewModel.camera)
        uiView.clear()
    }
}
