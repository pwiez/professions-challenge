//
//  professions_challengeApp.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 27/08/25.
//

import SwiftUI
import GoogleMaps
import MijickCamera

class AppDelegate: NSObject, UIApplicationDelegate, MApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask { AppDelegate.orientationLock }
}

@main
struct professions_challengeApp: App {
    let googleMapsAPIKey = "AIzaSyCuNk1p1_xXRUqg6p3IYgRvqD3KuwyAtcc"
    
    init() {
        GMSServices.provideAPIKey(googleMapsAPIKey)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
            // SwiftData container for data persistence
                .modelContainer(
                    for: [
                        RecordModel.self,
                        ArtifactModel.self,
                        ArtifactDataModel.self,
                        ArtifactDetailsModel.self,
                        LocationInfoModel.self,
                        AudioModel.self,
                        AudioRecording.self
                    ]
                )
            // Missing model for photo, audio, geolocalization (I guess)
        }
    }
}
