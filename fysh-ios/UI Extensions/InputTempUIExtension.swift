//
//  InputTempUIExtension.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

//Extends the InputTemp class to allow the user to input their initial data about stream temperature.
extension InputTemp{
    
    //Adds a text input field where the user can add the temperature they detected. The text field is titled "enter temp here: ".
    func addTextInput()  -> UITextField {
        let temperatureInput =  UITextField(frame: CGRect(x: 20, y: view.frame.height/2, width: 300, height: 40))
        
        //Title "Enter temp here: "
        temperatureInput.placeholder = "Enter temp here"
        temperatureInput.font = UIFont.systemFont(ofSize: 15)
        temperatureInput.borderStyle = UITextField.BorderStyle.roundedRect
        temperatureInput.autocorrectionType = UITextAutocorrectionType.no
        
        //Specifies the type of keyboard to be used.
        temperatureInput.keyboardType = UIKeyboardType.default
        temperatureInput.returnKeyType = UIReturnKeyType.done
        temperatureInput.clearButtonMode = UITextField.ViewMode.whileEditing
        temperatureInput.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        temperatureInput.delegate = self
        temperatureInput.keyboardType = UIKeyboardType.decimalPad
        view.addSubview(temperatureInput)
		
        //Specifies where the temperature input field should be placed on the screen.
		temperatureInput.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureInput.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            temperatureInput.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        
        return temperatureInput
    }
    
    //Adds a back button to the temperature input view that allows users to navigate back to the home page.
    func addUIBack() -> UIButton {
        let button = UIButton()
        let image = UIImage(named: "cancel")
		button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        view.addSubview(button)
        
        //Places button at the bottom left of the view.
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        return button
    }
    
    //Adds a next button that allows the user to proceed to the next step of inputting their data.
    func addNextButton() -> UIButton {
        let button = UIButton()
        button.setBackground(UIColor(named: "blue")!, for: .normal)
        button.setBackground(UIColor(named: "blue-h")!, for: .highlighted)
        button.setBackground(UIColor(red: 0.45, green: 0.45, blue: 0.45, alpha: 1.00), for: .disabled)
        button.isEnabled = false
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(pressedNext), for: .touchUpInside)
        view.addSubview(button)
        
        //Places button at the bottom right of the view.
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return button
    }
    
    //Adds a button to the screen that allows users to specify whether the temperature they are inputting was taken in celcius or fahrenheit. 
    func addTempTypeButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Fahrenheit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(pressedTempType), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return button
    }
}
