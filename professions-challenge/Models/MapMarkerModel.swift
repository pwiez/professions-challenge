//
//  MapMarkerModel.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 01/09/25.
//

import Foundation
import CoreLocation

struct MapMarkerModel: Identifiable {
    let id = UUID()
    let position: CLLocationCoordinate2D
    let title: String
    let snippet: String
}
