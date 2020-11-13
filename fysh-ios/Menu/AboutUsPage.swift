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
    
    //UIViewController manages a view heirarchy for the about us page.
    var presentingController: UIViewController?
    
    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //Sets the view controller that is presented
        presentingController = presentingViewController
        
        //Render the title of the page, all of the paragraphs, and the back button.
        aboutUsTitle = addAboutUsTitle()
        bullet1 = addBullet1()
        bullet2 = addBullet2()
        bullet3 = addBullet3()
        backButton = addUIBack()
    
    }
    
    //If the user presses the back button, bring their view back to the menu.
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: false, completion: nil)
    }


}
