//
//  LocationInfoModel.swift
//  professions-challenge
//
//  Created by Rafael Venetikides on 02/09/25.
//

import Foundation
import SwiftData

@Model
class LocationInfoModel {
    var site: String?
    var processNumber: Int?
    var adress: String?
    var institution: String?
    
    init(site: String? = nil, processNumber: Int? = nil, adress: String? = nil, institution: String? = nil) {
        self.site = site
        self.processNumber = processNumber
        self.adress = adress
        self.institution = institution
    }
}
