//
//  ContainerViewController.swift
//  Hitch
//
//  Created by Oron Ben Zvi on 9/23/17.
//  Copyright © 2017 Oron Ben Zvi. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case collapsed
    case expanded
}

enum ShowViewController {
    case home
}

private var showViewController: ShowViewController = .home

class ContainerViewController: UIViewController {
    
    var home: HomeViewController!
    var menu: MenuViewController!
    var centerController: UIViewController!
    var currentState: SlideOutState = .collapsed {
        didSet {
            let showShadow = currentState == .expanded
            shouldShowShadow(showShadow)
        }
    }
    
    var whiteCoverView: UIView?
    var tap: UITapGestureRecognizer?
    
    var isHidden = false
    let centerPanelExpandedOffset: CGFloat = 254

    override func viewDidLoad() {
        super.viewDidLoad()
        initCenter(screen: showViewController)
    }
    
    func initCenter(screen: ShowViewController) {
        var presentingController: UIViewController
        
        showViewController = screen
        
        if home == nil {
            home = UIStoryboard.homeViewController()
            home.delegate = self
        }
        
        presentingController = home
        
        if let controller = centerController {
            controller.view.removeFromSuperview()
            controller.removeFromParentViewController()
        }
        
        centerController = presentingController
        
        view.addSubview(centerController.view)
        addChildViewController(centerController)
        centerController.didMove(toParentViewController: self)
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return UIStatusBarAnimation.slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isHidden
    }
    
}

extension ContainerViewController: CenterViewControllerDelegate {
    func toggleLeftPanel() {
        let notAlreadyExpanded = (currentState != .expanded)
        
        if notAlreadyExpanded {
            addLeftPanelViewController()
        }
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
    }
    
    func addLeftPanelViewController() {
        if menu == nil {
            menu = UIStoryboard.menuViewController()
            addChildSidePanelViewController(menu)
        }
    }
    
    func addChildSidePanelViewController(_ sidePanelController: MenuViewController) {
        view.insertSubview(sidePanelController.view, at: 0)
        addChildViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        isHidden = !isHidden
        if shouldExpand {
            animateStatusBar()
            setupWhiteCoverView()
            
            currentState = .expanded
            animateCenterXPosition(targetPosition: centerPanelExpandedOffset)
        } else {
            animateStatusBar()
            hideWhiteCoverView()
            
            animateCenterXPosition(targetPosition: 0) { finished in
                if finished {
                    self.currentState = .collapsed
                    self.menu = nil
                }
            }
        }
    }
    
    func animateCenterXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.centerController.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
    
    func setupWhiteCoverView() {
        let whiteCoverView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        whiteCoverView.alpha = 0.0
        whiteCoverView.backgroundColor = UIColor.white
        
        centerController.view.addSubview(whiteCoverView)
        UIView.animate(withDuration: 0.2) { 
            whiteCoverView.alpha = 0.75
        }
        
        self.whiteCoverView = whiteCoverView
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(animateLeftPanel(shouldExpand:)))
        tap.numberOfTapsRequired = 1
        centerController.view.addGestureRecognizer(tap)
        self.tap = tap
    }
    
    func hideWhiteCoverView() {
        if let tap = tap {
            centerController.view.removeGestureRecognizer(tap)
        }
        UIView.animate(withDuration: 0.2, animations: {
            self.whiteCoverView?.alpha = 0.0
        }, completion: { finished in
            if finished {
                self.whiteCoverView?.removeFromSuperview()
                self.whiteCoverView = nil
            }
        })
    }
    
    func shouldShowShadow(_ show: Bool) {
        if show {
            centerController.view.layer.shadowOpacity = 0.6
        } else {
            centerController.view.layer.shadowOpacity = 0.0
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { 
            self.setNeedsStatusBarAppearanceUpdate()
        })
    }
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    class func menuViewController() -> MenuViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
    }
    
    class func homeViewController() -> HomeViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
    }
}
