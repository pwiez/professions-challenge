//
//  AudioModel.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import SwiftData

@Model
class AudioModel: Identifiable {
    var id = UUID()
    var name: String
    var audioDescription: String?
    var audioRecording: AudioRecording?
    
    init(name: String, audioDescription: String? = nil, audioRecording: AudioRecording? = nil) {
        self.name = name
        self.audioDescription = audioDescription
        self.audioRecording = audioRecording
    }
}
