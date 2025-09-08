//
//  CameraView.swift
//  professions-challenge
//
//  Created by Pedro Wiezel on 01/09/25.
//

import SwiftUI
import MijickCamera

struct CameraView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var imagemCapturada: CapturedImageModel?
    
    var body: some View {
        NavigationStack {
            MCamera()
                .setCameraScreen { cameraManager, namespace, closeAction in
                                    CameraModel(
                                        cameraManager: cameraManager,
                                        namespace: namespace,
                                        closeMCameraAction: {dismiss()}
                                    )
                                }
                .onImageCaptured { image, controller in
                    self.imagemCapturada = CapturedImageModel(uiImage: image)
                }
                .lockCameraInPortraitOrientation(AppDelegate.self)
                .setCapturedMediaScreen(CapturedScreen.init)
                .startSession()
        }
        .navigationBarBackButtonHidden()
    }
}
