//
//  PlaceCell.swift
//  PlacesProject
//
//  Created by Amy Ha on 01/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//

import Foundation
import UIKit

class PlaceCell: UITableViewCell {
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    func configure(_ vm: PlaceViewModel) {
        
        self.placeNameLabel.text = vm.name
        self.openingHoursLabel.text = "Open now: \(vm.openingHours)"
        self.ratingLabel.text = vm.rating
    }
}
