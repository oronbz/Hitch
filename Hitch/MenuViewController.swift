//
//  MenuViewController.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpLoginDidTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let loginController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        present(loginController, animated: true, completion: nil)
    }
    

}
