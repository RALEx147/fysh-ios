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
    
    func add1()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- Drag the screen so that it is resting over the point on the map where you took the stream temperature. ")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 80, width: 295, height: 400)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
    
    func add2()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- When you are in the correct location, tap the plus button at the bottom right of the screen.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 145, width: 295, height: 400)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
    
    func add3()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- When you do this, a pin will drop over that location, and you may select confirm, or drag adjust the location of the pin.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 200, width: 295, height: 400)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
    
    func add4()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- After confirming, you will be asked to enter the temperature you recorded, then you may select the time. The time will default to the current time, but can be adjusted to any time if you are not recording the temperature immediately after you take it.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 265, width: 295, height: 400)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
    
    func add5()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- Then, selecting done will send the data through and add a pin on the map that indicates your temperature findings, location, and time.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 380, width: 295, height: 400)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }

    
    func addHowToTitle() -> UITextView {
        let theText = NSAttributedString(string: "How To Use the App")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 41, y: 20, width: 250, height: 40)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 25)
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
    func addUIBack() -> UIButton {
        let button = UIButton()
//        let image = UIImage(systemName: "trash.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
		let image = UIImage(named: "buttonPlaceholder")
        button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        return button
    }
    
}
