//
//  InputTempUIExtension.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

extension InputTemp{
    
    func addTextInput(){
        
        let temperatureInput =  UITextField(frame: CGRect(x: 20, y: 10, width: 300, height: 40))
        temperatureInput.placeholder = "Enter temp here"
        temperatureInput.font = UIFont.systemFont(ofSize: 15)
        temperatureInput.borderStyle = UITextField.BorderStyle.roundedRect
        temperatureInput.autocorrectionType = UITextAutocorrectionType.no
        temperatureInput.keyboardType = UIKeyboardType.default
        temperatureInput.returnKeyType = UIReturnKeyType.done
        temperatureInput.clearButtonMode = UITextField.ViewMode.whileEditing
        temperatureInput.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        temperatureInput.delegate = self
        self.view.addSubview(temperatureInput)
    }
    
    func addNextButton(){
        let nextButton = UIButton()
        let image = UIImage(named: "buttonPlaceholder")
        nextButton.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
        nextButton.setImage(image, for: .normal)
        nextButton.addTarget(self, action: #selector(pressedNext), for: .touchUpInside)
        view.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 1)
        ])
    }
    
}
