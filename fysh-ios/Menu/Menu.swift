//
//  Menu.swift
//  fysh-ios
//
//  Created by Jack on 10/8/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import MapKit

//Creates a slide out menu containing options to go back to the home page, view the about us page, or view a page describing how to use the application.
class Menu: UIViewController {
    
    //Constructs a gradient for menu color, a UIStackView for the menu layout, and a UIButton indicating the option to return to the home page.
    var menuGrad : CAGradientLayer?
    var menu : UIStackView?
    var homeButton = UIButton()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Constructs a UIView for the menu layer.
        let menuLayer = UIView()
        menuLayer.frame = CGRect(x:0, y: 0, width: view.frame.width/3, height: view.frame.height)
        menuLayer.isUserInteractionEnabled = false
        
        //Creates a gradient for the Menu color going from left to right.
        let colorLeft = UIColor(red:255.0/255.0, green:255.0/255.0, blue:255.0/255.0, alpha:1.0).cgColor
        let colorRight = UIColor(red:198.0/255.0, green:198.0/255.0, blue:197.0/255.0, alpha:1.0).cgColor
        menuGrad = CAGradientLayer()
        menuGrad!.colors = [colorRight, colorLeft]
        menuGrad!.locations = [0,1]
        menuGrad!.startPoint = CGPoint(x: 0, y: 0.5)
        menuGrad!.endPoint = CGPoint(x: 1, y: 0.5)
        menuGrad!.frame = menuLayer.layer.frame
        menuLayer.layer.addSublayer(menuGrad!)
        
        //Adds the menu to the main home view.
        view.addSubview(menuLayer)
        
        //Specifies the size and layout of the menu as well as how menu items will be placed within the menu.
        menu = UIStackView()
        menu!.frame = CGRect(x:0, y: 0, width: view.frame.width/3, height: view.frame.height/4)
        menu!.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        menu!.alignment = .leading
        menu!.isLayoutMarginsRelativeArrangement = true
        menu!.axis = .vertical
        menu!.distribution = .equalSpacing
        menu!.spacing = 15
        menu!.backgroundColor = .white
        menu!.axis = .vertical
        menu!.alignment = .firstBaseline
        
        //Adds a home button for the top of the menu for accesibility purposes. Sets the image of the button to one titled "home" that displays the application icon.
        let home = UIButton()
        let image = UIImage(named: "home")
        home.setImage(image, for: .normal)
        
        //Adds a target for the menu button to return back to the home view when it is pressed.
        home.addTarget(self, action: #selector(goHome), for: .touchUpInside)
        menu?.addArrangedSubview(home)
        
        //Adds a UIButton to navigate to the about us page. It is a simple text button.
        let aboutUs = UIButton()
        aboutUs.setTitle("About Us", for: .normal)
        aboutUs.setTitleColor(.black, for: .normal)
        aboutUs.frame = CGRect(x: 5, y: 20, width: 40, height: 30)
        aboutUs.addTarget(self, action: #selector(goToAboutUs), for: .touchUpInside)
        menu?.addArrangedSubview(aboutUs)

        //Adds a UIButton to navigate to the how to page. It is a simple text button.
        let howTo = UIButton()
        howTo.setTitle("How to Use", for: .normal)
        howTo.titleLabel?.minimumScaleFactor = 0.1
        howTo.titleLabel?.numberOfLines = 1
        howTo.titleLabel?.adjustsFontSizeToFitWidth = true
        howTo.setTitleColor(.black, for: .normal)
        howTo.addTarget(self, action: #selector(goToHowTo), for: .touchUpInside)
        menu?.addArrangedSubview(howTo)
        
        //Adds the menu to the home page view.
        view.addSubview(menu!)
        
        //If a user taps outside of the menu, the menu will be dismissed.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        view.backgroundColor = .white
        
        
    }
    
    //Called to notify the view controller that its view has just laid out its subviews.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //Notifies the view controller that its view is about to be added to a view heirarchy.
    override func viewWillAppear(_ animated: Bool) {
        menuGrad!.frame = menu!.frame
    }
    
    //Dismisses the menu when the user taps outside of the menu.
    @objc func dismissMenu(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //Brings the user to the about us page when the about us button is tapped on the menu.
    @objc func goToAboutUs(){
        let aboutUsPage = AboutUsPage()
        aboutUsPage.modalPresentationStyle = .fullScreen
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        
        self.view.window!.layer.add(transition, forKey: nil)

        self.present(aboutUsPage, animated: false)
    }
    
    //Brings the user to the how to page when the about us button is tapped on the menu.
    @objc func goToHowTo(){
        let howToPage = HowToPage()
        howToPage.modalPresentationStyle = .fullScreen
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        
        self.view.window!.layer.add(transition, forKey: nil)
        
        self.present(howToPage, animated: false)
    }
    
    //Brings the user back to the home page when the home button is pressed at the top of the menu.
    @objc func goHome() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
