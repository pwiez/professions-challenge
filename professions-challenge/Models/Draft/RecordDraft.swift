//
//  RecordDraft.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 08/09/25.
//

import Foundation

class RecordDraft: ObservableObject {
    @Published var id: UUID = UUID()
    @Published var name: String = ""
    @Published var createdAt: Date = Date()
    
    @Published var location: LocationInfoModel? = nil
    @Published var artifactData: ArtifactDataModel? = nil
    @Published var artifactDetails: ArtifactDetailsModel? = nil
    @Published var audios: [AudioModel] = []
    @Published var photos: [CapturedImageModel] = []
    @Published var geolocation: MapMarkerModel? = nil
    
    var asRecordModel: RecordModel {
        let artifact = ArtifactModel(
            location: location,
            artifactData: artifactData,
            artifactDetails: artifactDetails
        )
        return RecordModel(
            id: id,
            name: name,
            createdAt: createdAt,
            artifact: artifact,
            audios: audios,
            photos: photos,
            geolocation: geolocation
        )
    }
}
