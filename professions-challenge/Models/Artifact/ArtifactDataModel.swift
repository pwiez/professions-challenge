//
//  ArtifactDataModel.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import SwiftData

@Model
class ArtifactDataModel {
    var registerNumber: Int?
    var denomination: String?
    var artifactDescription: String?
    var category: Category?
    var materials: [ArtifactMaterial]?
    var productionTechniques: [ProductionTechnique]?
    var decorations: [Decoration]?
    var conservationState: ConservationState?
    var conservationDescription: String?
    
    init(
        registerNumber: Int? = nil,
        denomination: String? = nil,
        artifactDescription: String? = nil,
        category: Category? = nil,
        materials: [ArtifactMaterial]? = nil,
        productionTechniques: [ProductionTechnique]? = nil,
        decorations: [Decoration]? = nil,
        conservationState: ConservationState? = nil,
        conservationDescription: String? = nil
    ) {
        self.registerNumber = registerNumber
        self.denomination = denomination
        self.artifactDescription = artifactDescription
        self.category = category
        self.materials = materials
        self.productionTechniques = productionTechniques
        self.decorations = decorations
        self.conservationState = conservationState
        self.conservationDescription = conservationDescription
    }
}
