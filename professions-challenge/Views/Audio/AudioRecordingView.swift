//
//  AudioRecordingView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import SwiftUI

struct AudioRecordingView: View {
    @StateObject private var recorder = AudioRecorder()
    @StateObject private var transcriber = AudioTranscriber()
    
    @State private var navigateToPreview = false
    @State private var recordedAudioURL: URL? = nil
    @State private var audioTranscription: String = ""
    
    @ObservedObject var recordDraft: RecordDraft
    
    var body: some View {
        ZStack {
            Color.light.ignoresSafeArea()
            
            NavigationLink("", isActive: $navigateToPreview) {
                if let url = recordedAudioURL {
                    AudioPreviewView(audioURL: url, initialTranscription: transcriber.transcription, recordDraft: recordDraft)
                }
            }
            .hidden()
            
            VStack(spacing: 20) {
                
                Spacer()
                
                if !recorder.isRecording {
                    VStack(alignment: .center) {
                        Text("Inicie a gravação")
                            .font(.system(size: 34))
                            .foregroundStyle(.black)
                        
                        Text("Toque no \"\(Image(systemName: "microphone.fill"))\" para começar.")
                            .font(.system(size: 17))
                            .foregroundStyle(.black)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 24) {
                    if recorder.isRecording {
                        Text(formatTime(recorder.recordingTime))
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(.blueDark2)
                            .transition(.opacity.combined(with: .scale))
                        
                        
                        VolumeVisualizerView(power: recorder.currentPower)
                            .frame(height: 60)
                            .padding(.vertical, 24)
                    }
                    
                    Button {
                        recorder.isRecording ? recorder.stopRecording() : recorder.startRecording()
                    } label: {
                        Text(recorder.isRecording ? Image(systemName: "square.fill") : Image(systemName: "microphone.fill"))
                            .font(.system(size: 17))
                            .padding(20)
                            .foregroundColor(.white)
                            .background {
                                Circle()
                                    .fill(.clay)
                            }
                    }
                }
                .animation(.easeInOut(duration: 0.1), value: recorder.isRecording)
                .padding(.top, 20)
                .padding(.bottom, 32)
                .frame(maxWidth: .infinity)
                .background{
                    Color.light2
                }
                
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .onChange(of: recorder.isRecording) { isRecording in
            if !isRecording {
                if let lastRecording = recorder.recordings.last {
                    recordedAudioURL = lastRecording.fileURL
                    audioTranscription = ""
                    transcriber.transcribeAudio(url: lastRecording.fileURL)
                }
            }
        }
        .onChange(of: transcriber.transcription) { oldValue, newValue in
            if !newValue.isEmpty {
                audioTranscription = newValue
                navigateToPreview = true
            }
        }
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let totalMilliseconds = Int((time * 100).rounded())
        let minutes = totalMilliseconds / 6000
        let seconds = (totalMilliseconds % 6000) / 100
        let hundredths = totalMilliseconds % 100
        
        return String(format: "%02d:%02d.%02d", minutes, seconds, hundredths)
    }
}

#Preview {
    AudioRecordingView(recordDraft: RecordDraft())
}
