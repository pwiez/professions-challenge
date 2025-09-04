//
//  Decoration.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 01/09/25.
//

import Foundation

enum Decoration: Codable {
    case smoothed
    case burnished
    case corrugated
    case brushed
    case ungulate
    case incision
    case impression
    case plastic
    case painted
    case punction
    case applique
    case englobe
    case stencil
    case carving
    case dontApply
    case other(description: String)
    
    var label: String {
        switch self {
        case .smoothed: return "Alisado"
        case .burnished: return "Brunido"
        case .corrugated: return "Corrugado"
        case .brushed: return "Escovado"
        case .ungulate: return "Ungulado"
        case .incision: return "Incisão"
        case .impression: return "Impressão"
        case .plastic: return "Plástica"
        case .painted: return "Pintado"
        case .punction: return "Punção"
        case .applique: return "Aplique"
        case .englobe: return "Engobe"
        case .stencil: return "Estêncil"
        case .carving: return "Entalhe"
        case .dontApply: return "Não se aplica"
        case .other(let description): return description
        }
    }
}
