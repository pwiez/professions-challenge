//
//  ArtifactModel.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 01/09/25.
//

import Foundation
import SwiftData

@Model
class ArtifactModel {
    var location: LocationInfoModel?
    var artifactData: ArtifactDataModel?
    var artifactDetails: ArtifactDetailsModel?
    
    init(
        location: LocationInfoModel? = nil,
        artifactData: ArtifactDataModel? = nil,
        artifactDetails: ArtifactDetailsModel? = nil
    ) {
        self.location = location
        self.artifactData = artifactData
        self.artifactDetails = artifactDetails
    }
}

extension ArtifactModel {
    static func mock() -> ArtifactModel {
        return ArtifactModel()
    }
}
