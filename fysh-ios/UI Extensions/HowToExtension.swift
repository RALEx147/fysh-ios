//
//  HowToExtension.swift
//  fysh-ios
//
//  Created by Katherine Peters on 10/26/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

extension HowToPage {
    
    func addHowTo()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "      Drag the screen so that it is resting over the point on the map where you took the stream temperature. When you are in the correct location, tap the plus button at the bottom right of the screen. When you do this, a pin will drop over that location, and you may select confirm, or drag adjust the location of the pin. After confirming, you will be asked to enter the temperature you recorded. After confirming, you may select the time. The time will default to the current time, but can be adjusted to any time if you are not recording the temperature immediately after you take it. Then, selecting done will send the data through and add a pin on the map that indicates your temperature findings, location, and time. ")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 15, y: 75, width: 300, height: 300)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 12)
        uiTextView.textAlignment = NSTextAlignment(.center)
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
    
    func addHowToTitle() -> UITextView {
        let theText = NSAttributedString(string: "How To Use the App")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 38, y: 20, width: 250, height: 40)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 25)
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
    
}
