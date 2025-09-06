//
//  ProductionTechnique.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 01/09/25.
//

enum ProductionTechnique: Codable, Hashable, SelectableOption {
    case chipped
    case chopped
    case polished
    case modeled
    case punctured
    case rolled
    case turned
    case molded
    case taxidermied
    case woven
    case blown
    case cast
    case forged
    case indefinite
    case other(description: String)
    
    var label: String {
        switch self {
        case .chipped: return "Lascado"
        case .chopped: return "Picateado"
        case .polished: return "Polido"
        case .modeled: return "Modelado"
        case .punctured: return "Perfurado"
        case .rolled: return "Roletado"
        case .turned: return "Torneado"
        case .molded: return "Moldado"
        case .taxidermied: return "Taxidermizado"
        case .woven: return "Tecido"
        case .blown: return "Assoprado"
        case .cast: return "Fundido"
        case .forged: return "Forjado"
        case .indefinite: return "Indeterminado"
        case .other(let description): return description
        }
    }
}

extension ProductionTechnique {
    static var selectableOptions: [ProductionTechnique] {
        [.chipped, .chopped, .polished, .modeled, .punctured, .rolled, .turned, .molded, .taxidermied, .woven, .blown, .cast, .forged, .indefinite]
    }
}
