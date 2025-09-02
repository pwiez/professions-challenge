//
//  professions_challengeApp.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 27/08/25.
//

import SwiftUI
import MijickCamera

class AppDelegate: NSObject, UIApplicationDelegate, MApplicationDelegate {
    static var orientationLock = UIInterfaceOrientationMask.all

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask { AppDelegate.orientationLock }
}

@main
struct professions_challengeApp: App {
    var body: some Scene {
        WindowGroup {
            CameraView()
        }
    }
}
