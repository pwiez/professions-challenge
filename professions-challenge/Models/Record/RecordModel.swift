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
    var photos: [UIImage]
    var audios: [AudioModel]
    // var location: 
    
    init(id: UUID, name: String, createdAt: Date, artifact: ArtifactModel, photos: [UIImage], audios: [AudioModel]) {
        self.id = id
        self.name = name
        self.createdAt = createdAt
        self.artifact = artifact
        self.photos = photos
        self.audios = audios
    }
}
