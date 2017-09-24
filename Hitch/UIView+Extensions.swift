//
//  UIView+Extensions.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/24/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTo(alpha: CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) { 
            self.alpha = alpha
        }
    }
    
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func keyboardWillChange(_ notification: Notification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let curFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let targetFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let deltaY = targetFrame.origin.y - curFrame.origin.y
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: { 
            self.frame.origin.y += deltaY
        }, completion: nil)
    }
}
