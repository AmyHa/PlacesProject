//
//  String+Extension.swift
//  PlacesProject
//
//  Created by Amy Ha on 01/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//

import UIKit

extension String {
    
    public var doubleValue: Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}
