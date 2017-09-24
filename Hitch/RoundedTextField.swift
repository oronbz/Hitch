//
//  RoundedTextField.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/24/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField {
    
    let textRectOffset: CGFloat = 20
    
    override func awakeFromNib() {
        setupView()
    }

    private func setupView() {
        layer.cornerRadius = frame.height / 2
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0 + textRectOffset, y: 0 + (textRectOffset / 2), width: bounds.width - textRectOffset, height: bounds.height - textRectOffset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0 + textRectOffset, y: 0 + (textRectOffset / 2), width: bounds.width - textRectOffset, height: bounds.height - textRectOffset)
    }

}
