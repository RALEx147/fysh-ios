//
//  Menu.swift
//  fysh-ios
//
//  Created by Jack on 10/8/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import MapKit
import WebKit

//Creates a slide out menu containing options to go back to the home page, view the about us page, or view a page describing how to use the application.
class Menu: UIViewController, WKUIDelegate {
    
    //Constructs a gradient for menu color, a UIStackView for the menu layout, and a UIButton indicating the option to return to the home page, go to the how to page, or go to our webpage.
    var menu = UIStackView()
    var home = UIButton()
    var aboutUs = UIButton()
    var howTo = UIButton()
    var contactUs = UIButton()
    var external = UIButton()
    
    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adds view customizations to the menu's appearance, creates a UIStackView for the menu, and adds a home button, about us button, how to button, and link to our webpage.
        addViewCustomizations()
        menu = addUIStackView()
        home = addUIHome()
        aboutUs = addUIAboutUs()
        howTo = addUIHowTo()
        contactUs = addUIContactUs()
        external = addUIExternal()
    }
    
    //If the user presses the external link button, they are currently taken to a placeholder web page.
    @objc func pressedExternal() {
        let wvc = WebViewController()
        self.present(wvc, animated: true)
    }
    
    //Brings the user to the about us page when the about us button is tapped on the menu.
    @objc func goToAboutUs(){
        expandMenuConstraints()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut]) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.window!.frame.size.width, height: self.view.window!.frame.size.height)
            self.view.layoutIfNeeded()
        } completion: { (_) in
            let aboutUsPage = AboutUsPage()
            aboutUsPage.modalPresentationStyle = .fullScreen
            let transition: CATransition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            
            self.view.window!.layer.add(transition, forKey: nil)
            self.present(aboutUsPage, animated: false)
        }
    }
    
    //Brings the user to the how to page when the about us button is tapped on the menu.
    @objc func goToHowTo(){
        expandMenuConstraints()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut]) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.window!.frame.size.width, height: self.view.window!.frame.size.height)
            self.view.layoutIfNeeded()
        } completion: { (_) in
            let howToPage = HowToPage()
            howToPage.modalPresentationStyle = .fullScreen
            let transition: CATransition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            
            self.view.window!.layer.add(transition, forKey: nil)
            self.present(howToPage, animated: false)
        }
    }
    
    //Brings the user back to the home page when the home button is pressed at the top of the menu.
    @objc func goToContactUs(){
        expandMenuConstraints()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut]) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.window!.frame.size.width, height: self.view.window!.frame.size.height)
            self.view.layoutIfNeeded()
        } completion: { (_) in
            let contactUsPage = ContactUsPage()
            contactUsPage.modalPresentationStyle = .fullScreen
            let transition: CATransition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.fade
            
            self.view.window!.layer.add(transition, forKey: nil)
            self.present(contactUsPage, animated: false)
        }
    }
    
    @objc func goHome() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Expands the constraints of the menu so that its full frame can be utilized.
    func expandMenuConstraints() {
        view.layer.cornerRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.window!.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.window!.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: view.window!.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: view.window!.trailingAnchor)
        ])
    }
    
}
