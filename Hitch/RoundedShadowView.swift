//
//  RoundedShadowView.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

class RoundedShadowView: UIView {
    
    override func awakeFromNib() {
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = 5.0
        layer.shadowOpacity = 0.3
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
    }

}
