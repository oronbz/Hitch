//
//  RoundImageView.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = frame.width / 2
        clipsToBounds = true
    }

}
