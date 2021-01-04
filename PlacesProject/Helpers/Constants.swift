//
//  Constants.swift
//  PlacesProject
//
//  Created by Amy Ha on 01/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//

/**
    Please input API key and radius of search values here. In a real application, we wouldn't expose the API key
 */

struct Constants {
    
    struct URL {
        static let radius = "1000"  // in metres
        static let apiKey = "AIzaSyArgIWsc2W-3FFX8EODzGnfWTMMKXg6GXY"
        static let apiUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?radius=\(radius)&key=\(apiKey)&keyword=surf&location="
    }
}
