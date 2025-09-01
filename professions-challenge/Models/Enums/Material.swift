//
//  Material.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 01/09/25.
//

import Foundation

enum Material {
    case rubber
    case coal
    case ceramic
    case faience
    case porcelain
    case leather
    case fossil
    case lithic
    case wood
    case malacological
    case metal
    case bone
    case paper
    case sediment
    case plastic
    case textile
    case flora
    case fauna
    case glass
    case indefinite
    case other(description: String)
    
    var label: String {
        switch self {
        case .rubber: return "Borracha"
        case .coal: return "Carvão"
        case .ceramic: return "Cerâmica"
        case .faience: return "Faiança"
        case .porcelain: return "Porcelana"
        case .leather: return "Couro"
        case .fossil: return "Fóssil"
        case .lithic: return "Lítico"
        case .wood: return "Madeira"
        case .malacological: return "Malacológico"
        case .metal: return "Metal"
        case .bone: return "Osso"
        case .paper: return "Papel"
        case .sediment: return "Sedimento"
        case .plastic: return "Plástico"
        case .textile: return "Textil"
        case .flora: return "Flora"
        case .fauna: return "Fauna"
        case .glass: return "Vidro"
        case .indefinite: return "Indefinido"
        case .other(let description): return description
        }
    }
}
