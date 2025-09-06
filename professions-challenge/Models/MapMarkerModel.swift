//
//  MapMarkerModel.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 01/09/25.
//

import Foundation
import CoreLocation
import SwiftData

@Model
class MapMarkerModel {
    var position: CLLocationCoordinate2D
    var title: String
    var snippet: String
    
    init(position: CLLocationCoordinate2D, title: String, snippet: String) {
        self.position = position
        self.title = title
        self.snippet = snippet
    }
}
