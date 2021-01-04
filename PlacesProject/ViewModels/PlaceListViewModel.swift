//
//  PlaceListViewModel.swift
//  PlacesProject
//
//  Created by Amy Ha on 01/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//

import Foundation

struct PlaceListViewModel {
    let places: [Place]
}

extension PlaceListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberofRowsInSection(_ section: Int) -> Int {
        return self.places.count
    }
    
    func placeAtIndex(_ index: Int) -> PlaceViewModel {
        let place = self.places[index]
        return PlaceViewModel(place)
    }
}

struct PlaceViewModel {
    private let place: Place
}

extension PlaceViewModel {
    // creating a new constructor, pass place to VM
    public init(_ place: Place) {
        self.place = place
    }
}

extension PlaceViewModel {
    
    var name: String {
        return self.place.name
    }
    
    var openingHours: String {
        
        guard let openNow = self.place.openingHours?.openNow else {
            return "N/A"
        }
        
        return openNow ? "Yes" : "No"
    }
    
    var rating: String {
        guard let rating = self.place.rating?.formatAsRating else {
            return "N/A"
        }
        
        return rating
    }
}
