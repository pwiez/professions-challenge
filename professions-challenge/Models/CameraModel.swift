//
//  CameraScreen.swift
//  professions-challenge
//
//  Created by Pedro Wiezel on 01/09/25.
//

import MijickCamera
import PhotosUI
import SwiftUI

struct CameraModel: MCameraScreen {
    @ObservedObject var cameraManager: CameraManager
    let namespace: Namespace.ID
    let closeMCameraAction: () -> ()
    @State var flashOn: Bool = false
    @State var isFrontCamera: Bool = false
    
    @State private var shouldPresentPhotosPicker: Bool = false
    @State private var selectedItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    init(cameraManager: CameraManager, namespace: Namespace.ID, closeMCameraAction: @escaping () -> Void) {
        self.cameraManager = cameraManager
        self.namespace = namespace
        self.closeMCameraAction = closeMCameraAction
    }
    
    var body: some View {
        ZStack {
            createCameraOutputView()
                .ignoresSafeArea()
            
            VStack (alignment: .center){
                HStack {
                    createFlashButton()
                        .padding(.bottom, 25)
                        .padding([.trailing, .leading], 40)
                    Spacer()
                    Button {
                        exit(0)
                    } label: {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 36))
                            .foregroundStyle(.white)
                            .padding(.bottom, 25)
                            .padding([.trailing, .leading], 40)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
                .padding(.top, 20)
                .background(Color.black.opacity(0.5))
                
                Spacer()
                
                HStack {
                    Button {
                        shouldPresentPhotosPicker.toggle()
                    } label: {
                        Image("GalleryButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                    }
                    .padding(.top, 15)
                    .padding([.trailing, .leading], 40)
                    .photosPicker(isPresented: $shouldPresentPhotosPicker, selection: $selectedItems, matching: .images)
                    .onChange(of: selectedItems) {
                        Task {
                            selectedImages.removeAll()
                            for item in selectedItems {
                                if let image = try? await item.loadTransferable(type: Image.self){
                                    selectedImages.append(image)
                                }
                            }
                        }
                    }
                    Spacer()
                    createCaptureButton()
                        .padding([.top, .trailing, .leading], 15)
                    Spacer()
                    createSwitchCameraButton()
                        .padding(.top, 15)
                        .padding([.trailing, .leading], 40)
                }
                .frame(maxWidth: .infinity, maxHeight: 80)
                .padding(.bottom, 20)
                .background(Color.black.opacity(0.5))
            }
        }
        .onAppear(perform: setDefaultCameraState)
        .preferredColorScheme(.dark)
    }
}

private extension CameraModel {
    func setDefaultCameraState() {
        self.flashOn = false
        self.isFrontCamera = false
        setFlashMode(.off)
        Task {
            try? await setCameraPosition(.back)
        }
    }
    func createCaptureButton() -> some View {
        Button {
            captureOutput()
        }
        label: {
            Image(systemName: "button.programmable")
                .font(.system(size: 70))
                .fontWeight(.thin)
                .foregroundStyle(.white)
        }
    }
    func createFlashButton() -> some View {
        Button {
            flashOn.toggle()
            flashOn ? setFlashMode(.on) : setFlashMode(.off)
        } label: {
            ZStack{
                Circle()
                    .fill(Color(red: 0.47, green: 0.47, blue: 0.47))
                    .frame(width: 45, height: 45)
                
                Image(systemName: flashOn ? "bolt.fill" : "bolt.slash.fill")
                    .padding(10)
                    .font(.system(size: 20))
                    .fontWeight(.light)
                    .foregroundStyle(.white)
            }
        }
    }
    func createSwitchCameraButton() -> some View {
        Button{
            isFrontCamera.toggle()
            Task {
                do {
                    try await isFrontCamera ? setCameraPosition(.front) : setCameraPosition(.back)
                } catch {
                    print("Erro ao definir a posição da câmera: \(error)")
                }
            }
            
        }
        label: {
            Image("CameraFlipButton")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
        }
    }
}
