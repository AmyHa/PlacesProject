//
//  Double+Extension.swift
//  PlacesProject
//
//  Created by Amy Ha on 01/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//

import Foundation

extension Double {
    
    public var formatAsRating: String {
        return String(format: "%.0f", self) + " / 5"
    }
}
