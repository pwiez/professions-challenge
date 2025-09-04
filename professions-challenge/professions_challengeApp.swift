//
//  professions_challengeApp.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 27/08/25.
//

import SwiftUI
import GoogleMaps

@main
struct professions_challengeApp: App {
    let googleMapsAPIKey = "AIzaSyCuNk1p1_xXRUqg6p3IYgRvqD3KuwyAtcc"
        
    init() {
        GMSServices.provideAPIKey(googleMapsAPIKey)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
