//
//  InputTimeUIExtension.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

extension InputConfirmation{
    
    func addDoneButton() -> UIButton {
        let button = UIButton()
        button.setBackground(UIColor(red: 0.25, green: 0.65, blue: 1.00, alpha: 1.00), for: .normal)
        button.setBackground(UIColor(red: 0.25, green: 0.45, blue: 1.00, alpha: 1.00), for: .highlighted)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(pressedDone), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return button
    }
    
    func addUIBack() -> UIButton {
        let button = UIButton()
        let image = UIImage(systemName: "trash.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
        button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        return button
    }
    
    
}
