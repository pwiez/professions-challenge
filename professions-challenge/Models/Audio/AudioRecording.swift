//
//  AudioRecording.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import SwiftData

@Model
class AudioRecording: Identifiable {
    var id = UUID()
    var fileURL: URL
    var fileName: String {
        fileURL.lastPathComponent
    }
    
    init(fileURL: URL) {
        self.fileURL = fileURL
    }
}
