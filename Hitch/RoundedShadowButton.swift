//
//  RoundedShadowButton.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

class RoundedShadowButton: UIButton {
    
    private var originalSize: CGRect?
    private let spinner = UIActivityIndicatorView()
    
    override func awakeFromNib() {
        setupView()
    }

    private func setupView() {
        originalSize = frame

        layer.cornerRadius = 5.0
        layer.shadowRadius = 10.0
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize.zero
        
        spinner.activityIndicatorViewStyle = .whiteLarge
        spinner.color = UIColor.darkGray
        spinner.alpha = 0.0
        spinner.hidesWhenStopped = true
    }
    
    func animateButton(shouldLoad: Bool, withMessage message: String? = nil) {
        if shouldLoad {
            addSubview(self.spinner)
            setTitle("", for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                self.layer.cornerRadius = self.frame.height / 2
                self.frame = CGRect(x: self.frame.midX - (self.frame.height / 2), y: self.frame.origin.y, width: self.frame.height, height: self.frame.height)
            }, completion: { finished in
                if finished {
                    self.spinner.startAnimating()
                    self.spinner.center = CGPoint(x: self.frame.width / 2 + 1, y: self.frame.width / 2 + 1)
                    self.spinner.fadeTo(alpha: 1.0, withDuration: 0.2)
                }
            })
            isUserInteractionEnabled = false
        } else {
            isUserInteractionEnabled = true
            spinner.stopAnimating()
            spinner.removeFromSuperview()
            self.setTitle(message, for: .normal)
            UIView.animate(withDuration: 0.2, animations: {
                self.layer.cornerRadius = 5.0
                self.frame = self.originalSize!
            })
        }
    }

}
