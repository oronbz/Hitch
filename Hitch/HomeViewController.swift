//
//  HomeViewController.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var actionButton: RoundedShadowButton!
    
    var delegate: CenterViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

