//
//  LoginViewController.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/24/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleScreenTap(sender:)))
        view.addGestureRecognizer(tap)
    }
    
    func handleScreenTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
