//
//  HowToPage.swift
//  fysh-ios
//
//  Created by Katherine on 10/19/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import SwiftUI

//Creates a How To Use the Application page, extended in HowToExtension.
class HowToPage: UIViewController, UITextViewDelegate {
    
    //Construct UITextViews for a title, and bullet points of instructions on how to use the application. Also construct a UIButton for a go back option. 
    var howToTitle = UITextView()
    var textBody1 = UITextView()
    var textBody2 = UITextView()
    var textBody3 = UITextView()
    var textBody4 = UITextView()
    var textBody5 = UITextView()
    var backButton = UIButton()
    
    //UIViewController manages a view heirarchy for the how to page.
    var presentingController: UIViewController?
    
    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "menu-color")
        
        presentingController = presentingViewController
        
        //Render the title of the page, all of the bullet points, and the back button.
        howToTitle = addHowToTitle()
        textBody1 = add1()
        textBody2 = add2()
        textBody3 = add3()
        textBody4 = add4()
        textBody5 = add5()
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
