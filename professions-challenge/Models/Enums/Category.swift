//
//  Category.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 01/09/25.
//

import Foundation

enum Category: Codable, Hashable, SelectableOption {
    case artefact
    case ecofact
    case bioarcheological
    case structure
    case sediment
    case archaeobotanical
    case zooarchaeological
    case other(description: String)
    
    var label: String {
        switch self {
        case .artefact: return "Artefato"
        case .ecofact: return "Ecofato"
        case .bioarcheological: return "Bioarqueológico"
        case .structure: return "Estrutura/Feição"
        case .sediment: return "Sedimento/Solo"
        case .archaeobotanical: return "Arqueobotânico"
        case .zooarchaeological: return "Zooarqueológico"
        case .other(let description): return description
        }
    }
}

extension Category {
    static var selectableOptions: [Category] {
        [.artefact, .ecofact, .bioarcheological, .structure, .sediment, .archaeobotanical, .zooarchaeological]
    }
}
