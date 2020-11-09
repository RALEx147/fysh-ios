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
    
    func addHowToTitle() -> UITextView {
        let theText = NSAttributedString(string: "How To Use the App")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 25)
        uiTextView.textAlignment = NSTextAlignment(.center)
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        
        //uiTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        return uiTextView
    }
    
    func add1()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- Drag the screen so that it is resting over the point on the map where you took the stream temperature. ")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 160, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        //uiTextView.topAnchor.constraint(equalTo: howToTitle.topAnchor, constant: 50)
    
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        
        //uiTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.howToTitle.bottomAnchor, constant: 50)
        ])
        return uiTextView
    }
    
    func add2()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- When you are in the correct location, tap the plus button at the bottom right of the screen.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 210, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        //uiTextView.topAnchor.constraint(equalTo: textBody1.topAnchor, constant: 50)
    
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        
        //uiTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.textBody1.bottomAnchor, constant: 50)
        ])
        
        return uiTextView
    }
    
    func add3()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- When you do this, a pin will drop over that location, and you may select confirm, or drag adjust the location of the pin.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 270, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        //uiTextView.topAnchor.constraint(equalTo: textBody2.topAnchor, constant: 50)
    
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        
        //uiTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.textBody2.bottomAnchor, constant: 50)
        ])
        return uiTextView
    }
    
    func add4()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- After confirming, you will be asked to enter the temperature you recorded, then you may select the time. The time will default to the current time, but can be adjusted to any time if you are not recording the temperature immediately after you take it.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 330, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        //uiTextView.topAnchor.constraint(equalTo: textBody3.topAnchor, constant: 50)
        
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        
        //uiTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.textBody3.bottomAnchor, constant: 50)
        ])
        return uiTextView
    }
    
    func add5()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- Then, selecting done will send the data through and add a pin on the map that indicates your temperature findings, location, and time.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 430, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        //uiTextView.topAnchor.constraint(equalTo: textBody4.topAnchor, constant: 50)
        
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        
        //uiTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.textBody4.bottomAnchor, constant: 50)
        ])
        
        return uiTextView
    }

    
    func addUIBack() -> UIButton {
        let button = UIButton()
        let image = UIImage(named: "back")
        button.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        return button
    }
    
}
