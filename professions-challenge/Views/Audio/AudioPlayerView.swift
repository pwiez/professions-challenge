//
//  AudioPlayerView.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 07/09/25.
//

import SwiftUI
import AVFoundation

struct AudioPlayerView: View {
    let audioURL: URL

    @State private var audioPlayer = AudioPlayer()
    @State private var isPlaying = false
    @State private var currentTime: TimeInterval = 0
    @State private var duration: TimeInterval = 1

    private let timeFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    @State private var timer: Timer?

    var body: some View {
        VStack(spacing: 12) {
            Slider(value: $currentTime, in: 0...duration, onEditingChanged: { editing in
                if !editing {
                    audioPlayer.seek(to: currentTime)
                }
            })
            .tint(.clay)

            HStack {
                Text(timeFormatter.string(from: currentTime) ?? "00:00")
                    .foregroundStyle(.blueDark2)
                    .font(.system(size: 16))
                Spacer()
                Text(timeFormatter.string(from: duration) ?? "00:00")
                    .foregroundStyle(.blueDark2)
                    .font(.system(size: 16))
            }

            Button(action: togglePlayback) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(.blueDark2)
            }
        }
        .onAppear {
            audioPlayer.setupAudio(from: audioURL)
            duration = audioPlayer.getDuration()
        }
        .onDisappear {
            stopPlayback()
        }
    }

    private func togglePlayback() {
        if isPlaying {
            stopPlayback()
        } else {
            audioPlayer.play()
            startTimer()
            isPlaying = true
        }
    }
    
    private func stopPlayback() {
        audioPlayer.stop()
        timer?.invalidate()
        timer = nil
        isPlaying = false
    }
    
    private func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true, block: { _ in
            currentTime = audioPlayer.getCurrentTime()
        })
    }
}
