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
    
    @ObservedObject var recordDraft: RecordDraft
    
    var camera: MCamera = MCamera()
    
    var body: some View {
        NavigationStack {
            camera
                .setCameraScreen { cameraManager, namespace, closeAction in
                    CameraModel(
                        cameraManager: cameraManager,
                        recordDraft: recordDraft,
                        namespace: namespace,
                        closeMCameraAction: {dismiss()}
                    )
                }
                .onImageCaptured { image, controller in
                    let captured = CapturedImageModel(uiImage: image)
                    self.imagemCapturada = captured
                    DispatchQueue.main.async {
                        recordDraft.photos.append(captured)
                    }
                }
                .setCapturedMediaScreen(CapturedScreen.init)
                .startSession()
        }
        .navigationBarBackButtonHidden()
    }
}
