//
//  HowToExtension.swift
//  fysh-ios
//
//  Created by Katherine Peters on 10/26/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

//An extension for the HowToPage class, creates specifications for the text that appears on the how to page describing how best to use the application.
extension HowToPage {
    
    //Adds the title to the how to page, centered within the frame.
    func addHowToTitle() -> UITextView {
        let theText = NSAttributedString(string: "How To Use the App")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Times New Roman", size: 25)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.isEditable = false
        uiTextView.backgroundColor = UIColor(named: "menu-color")
        uiTextView.textColor = UIColor(named: "off-white")
        
        uiTextView.delegate = self
        view.addSubview(uiTextView)

        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        return uiTextView
    }
    
    //Adds the first step of the how to page, centered within the frame.
    func add1()  -> UITextView {
        let theText = NSAttributedString(string: "- Drag the screen so that it is resting over the point on the map where you took the stream temperature. ")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 160, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Times New Roman", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        uiTextView.backgroundColor = UIColor(named: "menu-color")
        uiTextView.textColor = UIColor(named: "off-white")

        uiTextView.delegate = self
        view.addSubview(uiTextView)
        
        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.howToTitle.bottomAnchor, constant: 50)
        ])
        return uiTextView
    }
    
    //Adds the second bullet of the how to page, centered within the frame.
    func add2()  -> UITextView {
        let theText = NSAttributedString(string: "- When you are in the correct location, tap the plus button at the bottom right of the screen.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 210, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Times New Roman", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        uiTextView.backgroundColor = UIColor(named: "menu-color")
        uiTextView.textColor = UIColor(named: "off-white")
        
        uiTextView.delegate = self
        view.addSubview(uiTextView)

        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.textBody1.bottomAnchor, constant: 50)
        ])
        
        return uiTextView
    }
    
    //Adds the third bullet point of the how to page.
    func add3()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "- When you do this, a pin will drop over that location, and you may select confirm, or drag adjust the location of the pin.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 270, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Times New Roman", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        uiTextView.backgroundColor = UIColor(named: "menu-color")
        uiTextView.textColor = UIColor(named: "off-white")

        uiTextView.delegate = self
        view.addSubview(uiTextView)

        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.textBody2.bottomAnchor, constant: 50)
        ])
        return uiTextView
    }
    
    //Adds the fourth bullet point of the how to page.
    func add4()  -> UITextView {
        let theText = NSAttributedString(string: "- After confirming, you will be asked to enter the temperature you recorded, then you may select the time. The time will default to the current time, but can be adjusted to any time if you are not recording the temperature immediately after you take it.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 330, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Times New Roman", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        uiTextView.backgroundColor = UIColor(named: "menu-color")
        uiTextView.textColor = UIColor(named: "off-white")

        uiTextView.delegate = self
        view.addSubview(uiTextView)

        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.textBody3.bottomAnchor, constant: 50)
        ])
        return uiTextView
    }
    
    //Adds the fifth bullet point to the how to page.
    func add5()  -> UITextView {
        let theText = NSAttributedString(string: "- Then, selecting done will send the data through and add a pin on the map that indicates your temperature findings, location, and time.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 430, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Times New Roman", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        uiTextView.backgroundColor = UIColor(named: "menu-color")
        uiTextView.textColor = UIColor(named: "off-white")

        uiTextView.delegate = self
        view.addSubview(uiTextView)

        NSLayoutConstraint.activate([
            uiTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            uiTextView.topAnchor.constraint(equalTo: self.textBody4.bottomAnchor, constant: 50)
        ])
        
        return uiTextView
    }

    //Adds the back button to the how to page that allows a user to navigate back to the menu view and anchors it to the bottom left of the view. 
    func addUIBack() -> UIButton {
        let button = UIButton()
        let image = UIImage(named: "back")
        button.frame = CGRect(x: 0, y: 0, width: 8, height: 8)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])

        return button
    }
    
}
