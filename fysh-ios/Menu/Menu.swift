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
        menu.spacing = 10
        menu.alignment = .firstBaseline
        view.addSubview(menu)
        
        

        
        menu.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menu.topAnchor.constraint(equalTo: view.topAnchor),
            menu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menu.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30)
        ])
        
        
        let home = UIButton()
        let aboutUs = UIButton()
        let howTo = UIButton()
        
        home.setTitle("Home", for: .normal)
        home.setTitleColor(.white, for: .normal)
        home.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        menu.addArrangedSubview(home)
        
        aboutUs.setTitle("About Us", for: .normal)
        aboutUs.setTitleColor(.white, for: .normal)
        aboutUs.addTarget(self, action: #selector(goToAboutUs), for: .touchUpInside)
        menu.addArrangedSubview(aboutUs)

        howTo.setTitle("How to Use", for: .normal)
        howTo.setTitleColor(.white, for: .normal)
        howTo.addTarget(self, action: #selector(goToHowTo), for: .touchUpInside)
        menu.addArrangedSubview(howTo)
        
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
            externalButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            externalButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func pressedExternal() {
        let wvc = WebViewController()
        self.present(wvc, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
    }
    
    
    @objc func dismissMenu(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        view.layer.cornerRadius = 10
        self.updateViewConstraints()
    }
    
    @objc func goToAboutUs(){
        
        if let w = self.view.window {
            view.layer.cornerRadius = 0
            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: w.topAnchor),
                view.leadingAnchor.constraint(equalTo: w.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: w.trailingAnchor),
                view.bottomAnchor.constraint(equalTo: w.bottomAnchor)
            ])
            
            UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut]) {
                self.updateViewConstraints()
            } completion: { (_) in
                let aboutUsPage = AboutUsPage()
                aboutUsPage.modalPresentationStyle = .fullScreen
                let transition: CATransition = CATransition()
                transition.duration = 0.5
                transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                transition.type = CATransitionType.fade
                transition.subtype = CATransitionSubtype.fromLeft

                self.view.window!.layer.add(transition, forKey: nil)

                self.present(aboutUsPage, animated: false)
            }
        }

        
        
        
    }
    
    @objc func goToHowTo(){
        
        let howToPage = HowToPage()
        howToPage.modalPresentationStyle = .fullScreen
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromLeft
        
     
        
        self.view.window!.layer.add(transition, forKey: nil)
        
        
        self.present(howToPage, animated: false)
        
        
    }
    
    @objc func goHome() {
        //self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
