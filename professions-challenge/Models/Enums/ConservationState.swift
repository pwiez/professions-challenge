//
//  Conservation.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 01/09/25.
//

import Foundation

enum ConservationState: Codable, CaseIterable, Hashable {
    case good
    case regular
    case bad
    case awful
    
    var label: String {
        switch self {
        case .good: return "Bom"
        case .regular: return "Regular"
        case .bad: return "Ruim"
        case .awful: return "Péssimo"
        }
    }
}
