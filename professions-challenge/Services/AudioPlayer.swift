//
//  AudioPlayer.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import AVFoundation

class AudioPlayer: ObservableObject {
    private var audioPlayer: AVAudioPlayer?
    
    func setupAudio(from url: URL) {
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setCategory(.playback, mode: .default)
            try session.setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            print("Playing: \(url)")
        } catch {
            print("Error playing audio: \(error)")
        }
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func stop() {
        audioPlayer?.pause()
    }
    
    func seek(to time: TimeInterval) {
        audioPlayer?.currentTime = time
    }
    
    func getCurrentTime() -> TimeInterval {
        audioPlayer?.currentTime ?? 0
    }
    
    func getDuration() -> TimeInterval {
        audioPlayer?.duration ?? 1
    }
}
