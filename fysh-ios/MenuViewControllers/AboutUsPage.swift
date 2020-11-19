//
//  AboutUsPage.swift
//  fysh-ios
//
//  Created by Jack on 10/15/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import SwiftUI

//Creates an About Us page, extended in AboutUsExtension.
class AboutUsPage: UIViewController, UITextViewDelegate {
    
    //Constructs UITextViews for the title of the about us page, and the different paragraphs of the about us description. Also constructs a back button.
    var bullet1 = UITextView()
    var bullet2 = UITextView()
    var bullet3 = UITextView()
    var bullet4 = UITextView()
    var aboutUsTitle = UITextView()
    var backButton = UIButton()
    
    
    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "menu-color")
        
        //Render the title of the page, all of the paragraphs, and the back button.
        aboutUsTitle = addAboutUsTitle()
        bullet1 = addBullet1()
        bullet2 = addBullet2()
        bullet3 = addBullet3()
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
