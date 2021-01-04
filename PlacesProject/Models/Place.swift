//
//  Place.swift
//  PlacesProject
//
//  Created by Amy Ha on 30/12/2020.
//  Copyright © 2020 Amy Ha. All rights reserved.
//

import Foundation

struct PlaceList: Decodable {
    let places: [Place]
    
    enum CodingKeys: String, CodingKey {
        case places = "results"
    }
}

struct Place: Decodable {
    let name: String
    let openingHours: OpeningHours?
    let rating: Double?
    
    enum CodingKeys: String, CodingKey {
        case name
        case openingHours = "opening_hours"
        case rating
    }
}

struct OpeningHours: Decodable {
    let openNow: Bool?

    enum CodingKeys: String, CodingKey {
        case openNow = "open_now"
    }
}
