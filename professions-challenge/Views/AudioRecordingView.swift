//
//  AudioRecordingView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import SwiftUI

struct AudioRecordingView: View {
    @StateObject private var recorder = AudioRecorder()
    
    var body: some View {
        ZStack {
            Color.light.ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                NavigationLink("Hear recordings") {
                    AudioListView()
                }
                .padding(.top, 40)
                
                Spacer()
                
                if !recorder.isRecording {
                    VStack(alignment: .center) {
                        Text("Inicie a gravação")
                            .font(.system(size: 34))
                        
                        Text("Toque no \"\(Image(systemName: "microphone.fill"))\" para começar.")
                            .font(.system(size: 17))
                    }
                }
                
                Spacer()
                
                ZStack(alignment: .top) {
                    
                    Color.light2
                        .frame(width: 999, height: 200)
                        .ignoresSafeArea(edges: [.leading, .trailing, .bottom])
                    
                    
                    
                    VStack(alignment: .center) {
                        VolumeVisualizerView(power: recorder.currentPower)
                            .frame(height: 60)
                            .padding(.bottom, 8)
                            .padding(.top, 12)
                        
                        Button {
                            recorder.isRecording ? recorder.stopRecording() : recorder.startRecording()
                        } label: {
                            Text(recorder.isRecording ? Image(systemName: "square.fill") : Image(systemName: "microphone.fill"))
                                .font(.system(size: 22))
                                .padding()
                                .background(.clay)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                        .padding(.top, 12)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    AudioRecordingView()
}
