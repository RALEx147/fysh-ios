//
//  AboutUsPage.swift
//  fysh-ios
//
//  Created by Jack on 10/15/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import SwiftUI

class AboutUsPage: UIViewController, UITextViewDelegate {
    
    var textBody = UITextView()
    var aboutUsTitle = UITextView()
    var backButton = UIButton()
    
    var presentingController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presentingController = presentingViewController
        
        textBody = addAboutUsBody()
        aboutUsTitle = addAboutUsTitle()
        backButton = addUIBack()
    
    }
    
    @objc func pressedBack(){
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        
        
        
        self.view.window!.layer.add(transition, forKey: nil)
     //   self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
        self.dismiss(animated: false, completion: nil)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

