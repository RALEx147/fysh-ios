//
//  HowToPage.swift
//  fysh-ios
//
//  Created by Katherine on 10/19/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import SwiftUI
import MessageUI

//Creates a How To Use the Application page, extended in ContactUsExtension.
class SettingsPage: UIViewController {
    
    var backButton = UIButton()
    var overlayView = UIView()
    var overlaySwitch = UISwitch()
    var versionLabel = UILabel()
    
    var showReachOverlays = true
    var overlayCurrentlyOn = true
    
    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "menu-color")
        
        showReachOverlays = UserDefaults.standard.bool(forKey: "overlaytoggle")
        overlayCurrentlyOn = UserDefaults.standard.bool(forKey: "overlaytoggle")
        backButton = addUIBack()
        let o = addUIOverlayToggle()
        overlayView = o.view
        overlaySwitch = o.switch
        versionLabel = addUIVersion()
    }
    
    @objc func pressedOverlayToggle(){
        if overlaySwitch.isOn {
            showReachOverlays = true
        } else {
            showReachOverlays = false
        }
        UserDefaults.standard.setValue(showReachOverlays, forKey: "overlaytoggle")
    }
    
    
    
    //If the user presses the back button, bring their view back to the menu on the home page.
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        
        let vc = self.view.window!.rootViewController! as! ViewController
        if !showReachOverlays && overlayCurrentlyOn {
            vc.removeOverlay()
        } else if showReachOverlays && !overlayCurrentlyOn {
            vc.addOverlay()
        }
        
        self.view.window!.layer.add(transition, forKey: nil)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
}
