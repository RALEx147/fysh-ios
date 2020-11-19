//
//  AboutUsExtension.swift
//  fysh-ios
//
//  Created by Katherine Peters on 10/26/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

//Extends AboutUsPage to create a descriptive page of information about the project
extension AboutUsPage {
    
    //Creates a title for the About Us page that is not editable by the user and centered on the page regardles of frame size.
    func addAboutUsTitle() -> UITextView {
        let theText = NSAttributedString(string: "About Us")
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.font = UIFont(name: "Times New Roman", size: 25)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.backgroundColor = UIColor(named: "menu-color")
        uiTextView.textColor = UIColor(named: "off-white")
        
        uiTextView.delegate = self
        view.addSubview(uiTextView)
        return uiTextView
    }
    
    //Creates the first paragraph of text on the about us page centered in the view.
    func addBullet1()  -> UITextView {
        let aboutUs = NSAttributedString(string: "Central Pennsylvania is home to a network of fishable streams and experienced fishermen. Many of these fishermen frequently take temperature data at local streams to predict the water’s current fishability. The Citizen Science Watershed App Project hopes to gather this data from the local fishermen, and extend its meaning to climate change.")
        
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 160, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = aboutUs
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Times New Roman", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.backgroundColor = UIColor(named: "menu-color")
        uiTextView.textColor = UIColor(named: "off-white")
        
        uiTextView.delegate = self
        view.addSubview(uiTextView)
        
        
        return uiTextView
    }
    
    //Creates the second paragraph of text on the about us page, centered in the view.
    func addBullet2()  -> UITextView {
        let aboutUs = NSAttributedString(string: "Data is collected through our mobile application, prioritizing stream location, time and date, and water temperature. This information is then aggregated into mapped reaches of the local streams, and visualized according to their specific location. Our mobile application and the website both offer a local map decorated with informational pins indicating recent water temperatures, and the website offers additional visualizations of water temperature fluctuations over time.")
        
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 290, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = aboutUs
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
        
        
        return uiTextView
    }
    
    //Creates the third paragraph on the about us page, centered within the view.
    func addBullet3()  -> UITextView {
        let aboutUs = NSAttributedString(string: "Civil and Environmental Engineering Faculty at Bucknell University will then use the gathered data to look deeper into climate change and its impacts on central Pennsylvania’s watershed.")
        
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 450, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = aboutUs
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
        
        return uiTextView
    }

    //Creates the back button on the about us page that allows the user to return to the menu view and anchors it at the bottom left of the view. 
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
