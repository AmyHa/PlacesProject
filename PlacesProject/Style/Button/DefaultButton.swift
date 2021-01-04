//
//  DefaultButton.swift
//  PlacesProject
//
//  Created by Amy Ha on 01/01/2021.
//  Copyright © 2021 Amy Ha. All rights reserved.
//

import UIKit

class DefaultButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initButton()
    }
    
    func initButton() {
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.clear.cgColor
        layer.cornerRadius = frame.size.height / 6
        backgroundColor = Theme.Colour.primaryColour
        setTitleColor(UIColor.white, for: .normal)
    }
}
