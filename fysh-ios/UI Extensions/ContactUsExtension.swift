//
//  ContactUsExtension.swift
//  fysh-ios
//
//  Created by Robert Alexander on 11/13/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

extension ContactUsPage {
        
    func addUIBack() -> UIButton {
        let button = UIButton()
        let image = UIImage(named: "back")
        button.frame = CGRect(x: 0, y: 0, width: 8, height: 8)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        //button.translatesAutoresizingMaskIntoConstraints = false
        //NSLayoutConstraint.activate([
          //  button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
          //  button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        //])
        
        return button
    }
    
}
