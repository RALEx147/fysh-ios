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
    var homeButton = UIButton()
    var externalButton = UIButton()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        view.backgroundColor = UIColor(named: "menu-color")

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
        
        
        let home = UIButton(type: .system)
        let aboutUs = UIButton(type: .system)
        let howTo = UIButton(type: .system)

        home.setTitle("Home", for: .normal)
        home.titleLabel?.font = .systemFont(ofSize: 22)
        home.titleLabel?.adjustsFontSizeToFitWidth = true
        home.setTitleColor(UIColor(named: "off-white"), for: .normal)
        home.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        home.contentHorizontalAlignment = .left
        home.contentEdgeInsets = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 0)
        home.sizeToFit()
        menu.addArrangedSubview(home)
        home.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            home.leadingAnchor.constraint(equalTo: menu.leadingAnchor, constant: 0),
            home.trailingAnchor.constraint(equalTo: menu.trailingAnchor, constant: 0)
        ])
        
        aboutUs.setTitle("About Us", for: .normal)
        aboutUs.titleLabel?.font = .systemFont(ofSize: 22)
        aboutUs.titleLabel?.adjustsFontSizeToFitWidth = true
        aboutUs.setTitleColor(UIColor(named: "off-white"), for: .normal)
        aboutUs.addTarget(self, action: #selector(goToAboutUs), for: .touchUpInside)
        aboutUs.contentHorizontalAlignment = .left
        aboutUs.contentEdgeInsets = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 0)
        aboutUs.sizeToFit()
        menu.addArrangedSubview(aboutUs)
        aboutUs.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            aboutUs.leadingAnchor.constraint(equalTo: menu.leadingAnchor, constant: 0),
            aboutUs.trailingAnchor.constraint(equalTo: menu.trailingAnchor, constant: 0)
        ])
        
        
        howTo.setTitle("How to Use", for: .normal)
        howTo.titleLabel?.font = .systemFont(ofSize: 22)
        howTo.titleLabel?.adjustsFontSizeToFitWidth = true
        howTo.setTitleColor(UIColor(named: "off-white"), for: .normal)
        howTo.addTarget(self, action: #selector(goToHowTo), for: .touchUpInside)
        howTo.contentHorizontalAlignment = .left
        howTo.contentEdgeInsets = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 0)
        howTo.sizeToFit()
        menu.addArrangedSubview(howTo)
        howTo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            howTo.leadingAnchor.constraint(equalTo: menu.leadingAnchor, constant: 0),
            howTo.trailingAnchor.constraint(equalTo: menu.trailingAnchor, constant: 0)
        ])
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        
        
        externalButton.setImage(UIImage(named: "external"), for: .normal)
        externalButton.addTarget(self, action: #selector(pressedExternal), for: .touchUpInside)
        externalButton.layer.shadowRadius = 10
        view.addSubview(externalButton)
        
        externalButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            externalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            externalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
        
    }
    
    @objc func pressedExternal() {
        let wvc = WebViewController()
        self.present(wvc, animated: true)
    }
    
    
    @objc func goToAboutUs(){
        view.layer.cornerRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.window!.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.window!.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: view.window!.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: view.window!.trailingAnchor)
        ])
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut]) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.window!.frame.size.width, height: self.view.window!.frame.size.height)
            self.updateViewConstraints()
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
        view.layer.cornerRadius = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.window!.topAnchor),
            view.leadingAnchor.constraint(equalTo: view.window!.leadingAnchor),
            view.bottomAnchor.constraint(equalTo: view.window!.bottomAnchor),
            view.trailingAnchor.constraint(equalTo: view.window!.trailingAnchor)
        ])
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseInOut]) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.window!.frame.size.width, height: self.view.window!.frame.size.height)
            self.updateViewConstraints()
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
    
    
    @objc func dismissMenu(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
