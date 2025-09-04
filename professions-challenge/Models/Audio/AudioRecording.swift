//
//  AudioRecording.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation

class AudioRecording: Identifiable {
    let id = UUID()
    let fileURL: URL
    var fileName: String {
        fileURL.lastPathComponent
    }
    
    init(fileURL: URL) {
        self.fileURL = fileURL
    }
}
