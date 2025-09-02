//
//  AudioTranscriber.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import Speech

class AudioTranscriber: ObservableObject {
    @Published var transcription: String = ""
    
    private let recognizer = SFSpeechRecognizer(locale: Locale(identifier: "pt-BR"))
    private var request: SFSpeechRecognitionRequest?
    
    func transcribeAudio(url: URL) {
        SFSpeechRecognizer.requestAuthorization { [weak self] authStatus in
            guard authStatus == .authorized else {
                print("Permission denied")
                return
            }
            
            self?.request = SFSpeechURLRecognitionRequest(url: url)
            self?.request?.requiresOnDeviceRecognition = true
            
            guard let recognizer = self?.recognizer, recognizer.isAvailable else {
                print("Recognizer not available")
                return
            }
            
            recognizer.recognitionTask(with: self!.request!) { result, error in
                DispatchQueue.main.async {
                    if let result = result {
                        self?.transcription = result.bestTranscription.formattedString
                        print("Transcription: \(result.bestTranscription.formattedString)")
                    } else if let error = error {
                        print("Transcription error: \(error.localizedDescription)")
                        self?.transcription = "Error: \(error.localizedDescription)"
                    }
                }
            }
        }
    }
}
