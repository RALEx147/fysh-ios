//
//  AboutUsExtension.swift
//  fysh-ios
//
//  Created by Katherine Peters on 10/26/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

extension AboutUsPage {
    
    func addAboutUsTitle() -> UITextView {
        let theText = NSAttributedString(string: "About Us")
        let uiTextView = UITextView()
        //uiTextView.frame(.center)
        uiTextView.frame = CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.font = UIFont(name: "Arial", size: 25)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        
        uiTextView.delegate = self
        view.addSubview(uiTextView)
        return uiTextView
    }
    
    func addBullet1()  -> UITextView {//UITextField {
        let aboutUs = NSAttributedString(string: "Central Pennsylvania is home to a network of fishable streams and experienced fishermen. Many of these fishermen frequently take temperature data at local streams to predict the water’s current fishability. The Citizen Science Watershed App Project hopes to gather this data from the local fishermen, and extend its meaning to climate change.")
        
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 160, width: view.frame.width-20, height: view.frame.height)
        //uiTextView.frame = CGRect(x: 9, y: 65, width: 295, height: 450)
        uiTextView.attributedText = aboutUs
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        
        uiTextView.delegate = self
        view.addSubview(uiTextView)
        
        
        return uiTextView
    }
    
    func addBullet2()  -> UITextView {//UITextField {
        let aboutUs = NSAttributedString(string: "Data is collected through our mobile application, prioritizing stream location, time and date, and water temperature. This information is then aggregated into mapped reaches of the local streams, and visualized according to their specific location. Our mobile application and the website both offer a local map decorated with informational pins indicating recent water temperatures, and the website offers additional visualizations of water temperature fluctuations over time.")
        
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 290, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = aboutUs
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        uiTextView.delegate = self
        view.addSubview(uiTextView)
        
        
        return uiTextView
    }
    
    func addBullet3()  -> UITextView {//UITextField {
        let aboutUs = NSAttributedString(string: "Civil and Environmental Engineering Faculty at Bucknell University will then use the gathered data to look deeper into climate change and its impacts on central Pennsylvania’s watershed.")
        
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 10, y: 450, width: view.frame.width-20, height: view.frame.height)
        uiTextView.attributedText = aboutUs
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 14)
        uiTextView.textAlignment = NSTextAlignment(.center)
        uiTextView.allowsEditingTextAttributes = false
        uiTextView.isEditable = false
        uiTextView.isScrollEnabled = true
        
        uiTextView.delegate = self
        view.addSubview(uiTextView)
        
        
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
