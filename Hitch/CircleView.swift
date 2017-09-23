//
//  CircleView.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            setupView()
        }
    }
    
    override func awakeFromNib() {
        setupView()
    }
    
    private func setupView() {
        layer.cornerRadius = frame.width / 2
        layer.borderWidth = 1.5
        layer.borderColor = borderColor?.cgColor
    }
    
}
