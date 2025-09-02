//
//  AudioListView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import SwiftUI

struct AudioListView: View {
    @StateObject var recorder = AudioRecorder()
    @StateObject var player = AudioPlayer()
    @StateObject var transcriber = AudioTranscriber()
    
    @State private var selectedtranscription: String?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(recorder.recordings) { recording in
                    VStack(alignment: .leading, spacing: 6) {
                        HStack {
                            Text(recording.fileName)
                                .font(.headline)
                        }
                        
                        Spacer()
                        
                        Button {
                            player.playAudio(from: recording.fileURL)
                        } label: {
                            Image(systemName: "play.circle.fill")
                        }
                        
                        Button {
                            transcriber.transcribeAudio(url: recording.fileURL)
                        } label: {
                            Image(systemName: "text.bubble.fill")
                        }
                    }
                    
                    if transcriber.transcription != "" {
                        Text(transcriber.transcription)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.vertical, 4)
            }
            .navigationTitle("Recordings")
            .onAppear {
                recorder.fetchRecordings()
            }
        }
    }
}
