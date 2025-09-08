//
//  AudioModel.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import SwiftData

@Model
class AudioModel {
    var name: String
    var duration: Double
    var audioDescription: String?
    var audioRecording: AudioRecording?
    
    init(name: String, duration: Double, audioData: Data, audioDescription: String? = nil, audioRecording: AudioRecording? = nil) {
        self.name = name
        self.duration = duration
        self.audioDescription = audioDescription
        self.audioRecording = audioRecording
    }
}
