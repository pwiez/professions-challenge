//
//  CameraView.swift
//  professions-challenge
//
//  Created by Pedro Wiezel on 01/09/25.
//

import SwiftUI
import MijickCamera

struct CapturedImage: Identifiable {
    let id = UUID()
    let image: UIImage
}

struct CameraView: View {
    @State private var imagemCapturada: CapturedImage?
    @State private var showDetails = false
    
    var body: some View {
        NavigationStack {
            MCamera()
                .setCameraScreen(CameraModel.init)
                .onImageCaptured { image, controller in
                    self.imagemCapturada = CapturedImage(image: image)
                    self.showDetails = true
                }
                .lockCameraInPortraitOrientation(AppDelegate.self)
                .setCapturedMediaScreen(CapturedScreen.init)
                .startSession()
        }
    }
}

#Preview  {
    CameraView()
}
