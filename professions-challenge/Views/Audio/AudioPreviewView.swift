//
//  AudioPreviewView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 07/09/25.
//

import SwiftUI

struct AudioPreviewView: View {
    @Environment(\.dismiss) private var dismiss
    
    let audioURL: URL
    let initialTranscription: String
    
    var recordDraft: RecordDraft
    
    @State private var transcription: String = ""
    
    var body: some View {
        VStack(spacing: 24) {
            AudioPlayerView(audioURL: audioURL)
                .frame(height: 60)
            
            VStack(alignment: .leading, spacing: 12) {
                
                HStack(alignment: .top){
                    TextEditor(text: $transcription)
                        .foregroundStyle(.blueDark2)
                        .font(.system(size: 15))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(16)
                        .scrollContentBackground(.hidden)
                        .background(Color.clear)
                    
                    Spacer()
                    
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 16))
                        .foregroundStyle(.blueDark2)
                        .padding(16)
                }
                .background{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.light2)
                }
                .frame(maxHeight: 210)
                .padding(.top, 20)
                
            }
            
            Spacer()
            
            Button {
                salvarAudio()
                dismiss()
            } label: {
                Text("Salvar")
                    .font(.system(size: 17))
                    .foregroundStyle(.light)
                    .padding(.vertical, 14)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.clay)
                    }
            }
        }
        .onAppear {
            transcription = initialTranscription
            print(initialTranscription)
        }
        .padding(.top, 40)
        .padding(.horizontal, 12)
        .background(Color.light.ignoresSafeArea())
    }
    
    private func salvarAudio() {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yy"
            let dateString = formatter.string(from: date)

            let count = recordDraft.audios.filter {
                $0.name.hasPrefix(dateString)
            }.count + 1
            
            let name = "\(dateString) - \(count)"
            let recording = AudioRecording(fileURL: audioURL)
            let newAudio = AudioModel(name: name, audioDescription: transcription, audioRecording: recording)
            
            recordDraft.audios.append(newAudio)
        }
}
