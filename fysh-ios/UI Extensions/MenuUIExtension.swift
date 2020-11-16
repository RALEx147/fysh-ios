//
//  MenuUIExtension.swift
//  fysh-ios
//
//  Created by Robert Alexander on 11/12/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

//Extension of the Menu class to add specifications to the layout of the menu.
extension Menu{
    
    //Customizes the view of the menu, specifying the background color of the menu and margins.
    func addViewCustomizations() {
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        view.backgroundColor = UIColor(named: "menu-color")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goHome))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
    }
    
    //Adds the stack view that is the base of the menu layout. Specifies spacing, alignment, background color, and more attributes of the menu appearance.
    func addUIStackView() -> UIStackView{
        let menu = UIStackView()
        menu.backgroundColor = UIColor(named: "menu-color")
        menu.layoutMargins = UIEdgeInsets(top: 10, left: 12, bottom: 0, right: 0)
        menu.alignment = .top
        menu.isLayoutMarginsRelativeArrangement = true
        menu.axis = .vertical
        menu.spacing = 1
        menu.alignment = .firstBaseline
        view.addSubview(menu)
        
        menu.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: view.topAnchor),
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30)
        ])
        
        return menu
    }
    
    //Adds the home button to the menu as text that reads "Home". Sets the action of the home button when clicked to return back to the main map view on the home page.
    func addUIHome() -> UIButton {
        let home = UIButton(type: .system)
        home.setTitle("Home", for: .normal)
        home.titleLabel?.font = .systemFont(ofSize: 20)
        home.titleLabel?.adjustsFontSizeToFitWidth = true
        home.setTitleColor(UIColor(named: "off-white"), for: .normal)
        home.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        home.contentHorizontalAlignment = .left
        home.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
        home.sizeToFit()
        menu.addArrangedSubview(home)
        
        home.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            home.leadingAnchor.constraint(equalTo: menu.leadingAnchor, constant: 0),
            home.trailingAnchor.constraint(equalTo: menu.trailingAnchor, constant: 0)
        ])
        
        return home
    }
    
    //Adds the about us button on the menu below the home button. It is a simple button that reads "About Us", and brings the user to the about us page.
    func addUIAboutUs() -> UIButton {
        let aboutUs = UIButton(type: .system)
        aboutUs.setTitle("About Us", for: .normal)
        aboutUs.titleLabel?.font = .systemFont(ofSize: 20)
        aboutUs.titleLabel?.adjustsFontSizeToFitWidth = true
        aboutUs.setTitleColor(UIColor(named: "off-white"), for: .normal)
        aboutUs.addTarget(self, action: #selector(goToAboutUs), for: .touchUpInside)
        aboutUs.contentHorizontalAlignment = .left
        aboutUs.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
        aboutUs.sizeToFit()
        menu.addArrangedSubview(aboutUs)
        
        aboutUs.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutUs.leadingAnchor.constraint(equalTo: menu.leadingAnchor, constant: 0),
            aboutUs.trailingAnchor.constraint(equalTo: menu.trailingAnchor, constant: 0)
        ])
        
        return aboutUs
    }
    
    //Adds how to button to the menu, simply indicated by text that reads "How To Use". Specifies that when this button is tapped, the user should be brought to the How To page.
    func addUIHowTo() -> UIButton {
        let howTo = UIButton(type: .system)
        howTo.setTitle("How to Use", for: .normal)
        howTo.titleLabel?.font = .systemFont(ofSize: 20)
        howTo.titleLabel?.adjustsFontSizeToFitWidth = true
        howTo.setTitleColor(UIColor(named: "off-white"), for: .normal)
        howTo.addTarget(self, action: #selector(goToHowTo), for: .touchUpInside)
        howTo.contentHorizontalAlignment = .left
        howTo.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
        howTo.sizeToFit()
        menu.addArrangedSubview(howTo)
        
        howTo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            howTo.leadingAnchor.constraint(equalTo: menu.leadingAnchor, constant: 0),
            howTo.trailingAnchor.constraint(equalTo: menu.trailingAnchor, constant: 0)
        ])
        
        return howTo
    }
    
    //Adds a button to the menu that can bring the user to a website that is currently just a placeholder, but could be replaced by a link to our web application in the future. 
    func addUIExternal() -> UIButton {
        let externalButton = UIButton()
        externalButton.setImage(UIImage(named: "external"), for: .normal)
        externalButton.addTarget(self, action: #selector(pressedExternal), for: .touchUpInside)
        externalButton.imageView?.contentMode = .scaleAspectFit
        view.addSubview(externalButton)
        
        externalButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            externalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            externalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            externalButton.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        externalButton.sizeToFit()

        return externalButton
    }
    
    
    
    
}
