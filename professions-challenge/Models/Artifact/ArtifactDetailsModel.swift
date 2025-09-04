//
//  ArtifactDetailsModel.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import SwiftData

@Model
class ArtifactDetailsModel {
    var inscriptions: String?
    var filiation: String?
    var height: Double?
    var width: Double?
    var depth: Double?
    var weight: Double?
    
    init(inscriptions: String? = nil, filiation: String? = nil, height: Double? = nil, width: Double? = nil, depth: Double? = nil, weight: Double? = nil) {
        self.inscriptions = inscriptions
        self.filiation = filiation
        self.height = height
        self.width = width
        self.depth = depth
        self.weight = weight
    }
}
