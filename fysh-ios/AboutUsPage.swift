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
    
    var bullet1 = UITextView()
    var bullet2 = UITextView()
    var bullet3 = UITextView()
    var bullet4 = UITextView()
    var aboutUsTitle = UITextView()
    
    var presentingController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presentingController = presentingViewController
        
        bullet1 = addBullet1()
        bullet2 = addBullet2()
        bullet3 = addBullet3()
        aboutUsTitle = addAboutUsTitle()
        
    
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
