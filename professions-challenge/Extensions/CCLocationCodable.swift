//
//  CCLocationCodable.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 04/09/25.
//

import CoreLocation

extension CLLocationCoordinate2D: Codable { // necessary to make CLLocationCoordinate2D savable in CoreData/SwiftData
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let latitude = try container.decode(CLLocationDegrees.self, forKey: .latitude)
        let longitude = try container.decode(CLLocationDegrees.self, forKey: .longitude)
        self.init(latitude: latitude, longitude: longitude)
    }
}
