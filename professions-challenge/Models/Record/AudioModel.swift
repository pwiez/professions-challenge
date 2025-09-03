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
    var audioData: Data
    var audioDescription: String?
    
    init(name: String, duration: Double, audioData: Data, audioDescription: String? = nil) {
        self.name = name
        self.duration = duration
        self.audioData = audioData
        self.audioDescription = audioDescription
    }
}
