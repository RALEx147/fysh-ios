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

class Menu: UIViewController, WKUIDelegate {
    
    var menu = UIStackView()
    
    var home = UIButton()
    var aboutUs = UIButton()
    var howTo = UIButton()
    var external = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViewCustomizations()
        menu = addUIStackView()
        home = addUIHome()
        aboutUs = addUIAboutUs()
        howTo = addUIHowTo()
        external = addUIExternal()
    }
    
    @objc func pressedExternal() {
        let wvc = WebViewController()
        self.present(wvc, animated: true)
    }
    
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
            transition.subtype = CATransitionSubtype.fromLeft
            
            self.view.window!.layer.add(transition, forKey: nil)
            self.present(aboutUsPage, animated: false)
        }
    }
    
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
    
    @objc func goHome() {
        self.dismiss(animated: true, completion: nil)
    }
    
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
