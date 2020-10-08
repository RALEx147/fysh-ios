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
        
        
        let slide: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(slide)
        
        
        let menu = UIView()
        menu.frame = CGRect(x:0, y: 0, width: view.frame.width/3, height: view.frame.height)
        menu.backgroundColor = .white
        view.addSubview(menu)
        
        view.backgroundColor = .white
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
