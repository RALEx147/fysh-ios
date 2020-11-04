//
//  Menu.swift
//  fysh-ios
//
//  Created by Jack on 10/8/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import MapKit

class Menu: UIViewController {
    
    var menuGrad : CAGradientLayer?
    var menu : UIStackView?
    var homeButton = UIButton()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let menuLayer = UIView()
        menuLayer.frame = CGRect(x:0, y: 0, width: view.frame.width/3, height: view.frame.height)
        menuLayer.isUserInteractionEnabled = false
        
        
        let colorLeft = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0).cgColor
        let colorRight = UIColor(red:198.0/255.0, green:198.0/255.0, blue:197.0/255.0, alpha:1.0).cgColor
        menuGrad = CAGradientLayer()
        menuGrad!.colors = [colorRight, colorLeft]
        menuGrad!.locations = [0,1]
        menuGrad!.startPoint = CGPoint(x: 0, y: 0.5)
        menuGrad!.endPoint = CGPoint(x: 1, y: 0.5)
        menuGrad!.frame = menuLayer.layer.frame
        menuLayer.layer.addSublayer(menuGrad!)
        
        view.addSubview(menuLayer)
        
        
        
        
        menu = UIStackView()
        
        //3
        menu!.frame = CGRect(x:0, y: 0, width: view.frame.width/3, height: view.frame.height)
        menu!.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        menu!.alignment = .firstBaseline
        menu!.isLayoutMarginsRelativeArrangement = true
        menu!.axis = .vertical
        menu!.distribution = .equalSpacing
        menu!.spacing = 15
        //menu!.constraints =
        menu!.backgroundColor = .white
        menu!.axis = .vertical
        menu!.alignment = .firstBaseline //.center
        
        
        
        
        let home = UIButton()
        home.setTitle("Home", for: .normal)
        home.setTitleColor(.black, for: .normal)
        home.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        //menu?.addSubview(home)
        menu?.addArrangedSubview(home)
        //menu!.setCustomSpacing(10, after: home)
        //menu?.insertArrangedSubview(home, at: 1)
        
        let aboutUs = UIButton()
        aboutUs.setTitle("About Us", for: .normal)
        aboutUs.setTitleColor(.black, for: .normal)
        
        aboutUs.addTarget(self, action: #selector(goToAboutUs), for: .touchUpInside)
        
        //menu?.insertSubview(aboutUs, belowSubview: home)
        //menu?.addSubview(aboutUs)
        menu?.addArrangedSubview(aboutUs)
        //menu?.insertArrangedSubview(aboutUs, at: 2)

        
        let howTo = UIButton()
        howTo.setTitle("How To", for: .normal)
        howTo.setTitleColor(.black, for: .normal)
        howTo.addTarget(self, action: #selector(goToHowTo), for: .touchUpInside)
        //menu?.addSubview(howTo)
        menu?.addArrangedSubview(howTo)
        //menu?.insertArrangedSubview(howTo, at: 3)
        
        
        
        view.addSubview(menu!)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        view.backgroundColor = .white
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        menuGrad!.frame = menu!.frame
    }
    
    @objc func dismissMenu(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func goToAboutUs(){
        
        let aboutUsPage = AboutUsPage()
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        
        self.view.window!.layer.add(transition, forKey: nil)

        self.present(aboutUsPage, animated: false)
        
        
    }
    
    @objc func goToHowTo(){
        
        let howToPage = HowToPage()
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        
        self.view.window!.layer.add(transition, forKey: nil)
        
        
        self.present(howToPage, animated: false)
        
        
    }
    
    @objc func goHome() {
        //self.view.window!.layer.add(transition, forKey: nil)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
