//
//  HomeViewController.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit
import MapKit
import RevealingSplashView

class HomeViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var actionButton: RoundedShadowButton!
    
    var delegate: CenterViewControllerDelegate?
    
    var revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "launchScreenIcon"), iconInitialSize: CGSize(width: 80, height: 80), backgroundColor: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(revealingSplashView)
        revealingSplashView.animationType = .heartBeat
        revealingSplashView.startAnimation()
        
        revealingSplashView.heartAttack = true
    }

    @IBAction func actionButtonDidTap(_ sender: Any) {
        actionButton.animateButton(shouldLoad: true)
    }

    @IBAction func menuButtonDidTap(_ sender: Any) {
        delegate?.toggleLeftPanel()
    }
    
    @IBAction func locateButtonDidTap(_ sender: Any) {
    }
}

