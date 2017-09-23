//
//  GradientView.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

class GradientView: UIView {

    override func awakeFromNib() {
        setupGradientView()
    }
    
    private func setupGradientView() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.white.cgColor, UIColor(white: 1.0, alpha: 0.0).cgColor]
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.locations = [0.8, 1.0]
        layer.addSublayer(gradient)
    }

}
