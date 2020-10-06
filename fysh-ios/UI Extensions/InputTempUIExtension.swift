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
	
	func addTextInput()  -> UITextField {
		let temperatureInput =  UITextField(frame: CGRect(x: 20, y: view.frame.height/2, width: 300, height: 40))
		temperatureInput.placeholder = "Enter temp here"
		temperatureInput.font = UIFont.systemFont(ofSize: 15)
		temperatureInput.borderStyle = UITextField.BorderStyle.roundedRect
		temperatureInput.autocorrectionType = UITextAutocorrectionType.no
		temperatureInput.keyboardType = UIKeyboardType.default
		temperatureInput.returnKeyType = UIReturnKeyType.done
		temperatureInput.clearButtonMode = UITextField.ViewMode.whileEditing
		temperatureInput.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		temperatureInput.delegate = self
		temperatureInput.keyboardType = UIKeyboardType.decimalPad
		self.view.addSubview(temperatureInput)
		
		return temperatureInput
	}
	
	func addNextButton() -> UIButton {
		let button = UIButton()
		button.backgroundColor = UIColor(red: 0.25, green: 0.65, blue: 1.00, alpha: 1.00)
		button.setTitle("Next", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.layer.cornerRadius = 5
		button.addTarget(self, action: #selector(pressedNext), for: .touchUpInside)
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
	
}
