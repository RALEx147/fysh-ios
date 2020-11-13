//
//  HowToPage.swift
//  fysh-ios
//
//  Created by Katherine on 10/19/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import SwiftUI

//Creates a How To Use the Application page, extended in ContactUsExtension.
class ContactUsPage: UIViewController {
    
    var backButton = UIButton()
    //UIViewController manages a view heirarchy for the how to page.
    var presentingController: UIViewController?
    
    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "menu-color")
        
        presentingController = presentingViewController
        
        backButton = addUIBack()
    }
    
    //If the user presses the back button, bring their view back to the menu on the home page.
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        
        self.view.window!.layer.add(transition, forKey: nil)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
}
