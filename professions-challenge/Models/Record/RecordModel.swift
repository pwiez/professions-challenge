//
//  RecordModel.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class RecordModel {
    @Attribute(.unique) var id: UUID
    var name: String
    var createdAt: Date
    var artifact: ArtifactModel
    var photos: [CapturedImageModel]
    var audios: [AudioModel]
    // var location: 
    
    init(id: UUID, name: String, createdAt: Date, artifact: ArtifactModel, audios: [AudioModel], photos: [CapturedImageModel]) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.artifact = artifact
//        self.photos = photos
        self.audios = audios
        self.photos = photos
    }
}

extension RecordModel {
    static func mock() -> RecordModel {
        return RecordModel(
            id: UUID(),
            name: "Ficha 1",
            createdAt: Date(),
            artifact: ArtifactModel.mock(),
            audios: [],
            photos: []
        )
    }
}
