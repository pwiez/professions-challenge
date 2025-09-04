//
//  AudioRecorder.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import AVFoundation
import SwiftUI

class AudioRecorder: ObservableObject {
    private var audioRecorder: AVAudioRecorder?
    private let audioSession = AVAudioSession.sharedInstance()
    
    @Published var isRecording = false
    @Published var recordings: [AudioRecording] = []
    @Published var currentPower: Float = 0.0
    
    private var timer: Timer?
    
    func startRecording() {
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            AVAudioApplication.requestRecordPermission { [weak self] allowed in
                if allowed {
                    self?.beginRecording()
                } else {
                    print("Microfone usage denied.")
                }
            }
        } catch {
            print("Error configuring audio session: \(error)")
        }
    }
    
    private func beginRecording() {
        let fileName = "recording.m4a"
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let audioURL = paths[0].appendingPathComponent(fileName)
        
        let settings: [String: Any] = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
            audioRecorder?.isMeteringEnabled = true
            audioRecorder?.record()
            isRecording = true
            print("Recording in: \(audioURL)")
            
            timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { [weak self] _ in
                self?.audioRecorder?.updateMeters()
                let power = self?.audioRecorder?.averagePower(forChannel: 0) ?? -160
                DispatchQueue.main.async {
                    self?.currentPower = power
                }
            }
        } catch {
            print("Error starting recording: \(error)")
        }
    }
    
    func stopRecording() {
        audioRecorder?.stop()
        isRecording = false
        timer?.invalidate()
        timer = nil
        fetchRecordings()
    }
    
    func fetchRecordings() {
        recordings.removeAll()
        
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        do {
            let urls = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            for url in urls {
                if url.pathExtension == "m4a" {
                    recordings.append(AudioRecording(fileURL: url))
                }
            }
        } catch {
            print("Error listing recordings: \(error)")
        }
    }
}
