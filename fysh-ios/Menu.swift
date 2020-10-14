//
//  Menu.swift
//  fysh-ios
//
//  Created by Jack on 10/8/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit

class Menu: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tap)
        view.backgroundColor = .white
        
        let menu = UIStackView()
        
        menu.frame = CGRect(x:0, y: 0, width: view.frame.width/3, height: view.frame.height)
        menu.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        menu.isLayoutMarginsRelativeArrangement = true
        menu.backgroundColor = .white

        view.addSubview(menu)
        
        
        
        let aboutUs = UIButton()
        aboutUs.setTitle("About Us", for: .normal)
        aboutUs.setTitleColor(.black, for: .normal)
        menu.addArrangedSubview(aboutUs)
        
        
        let howTo = UIButton()
        howTo.setTitle("How to Use", for: .normal)
        aboutUs.setTitleColor(.black, for: .normal)
        menu.addArrangedSubview(howTo)
        
    }
    
    @objc func dismissMenu(){
        print("called")
        self.dismiss(animated: true, completion: nil)
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
