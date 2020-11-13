//
//  HowToPage.swift
//  fysh-ios
//
//  Created by Katherine on 10/19/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import SwiftUI

class HowToPage: UIViewController, UITextViewDelegate {
    
    var howToTitle = UITextView()
    var textBody1 = UITextView()
    var textBody2 = UITextView()
    var textBody3 = UITextView()
    var textBody4 = UITextView()
    var textBody5 = UITextView()
    var backButton = UIButton()
    
    var presentingController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "menu-color")
        
        presentingController = presentingViewController
        
        howToTitle = addHowToTitle()
        textBody1 = add1()
        textBody2 = add2()
        textBody3 = add3()
        textBody4 = add4()
        textBody5 = add5()
        backButton = addUIBack()
    }
    
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        
        self.view.window!.layer.add(transition, forKey: nil)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
}
