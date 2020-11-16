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
    
    func addTextInput() -> UITextField {
        let temperatureInput = UITextField()
        temperatureInput.placeholder = "Enter Temp Here"
        temperatureInput.font = UIFont.systemFont(ofSize: 15)
        temperatureInput.borderStyle = .roundedRect
        temperatureInput.returnKeyType = .done
        temperatureInput.clearButtonMode = .never
        temperatureInput.textAlignment = .right
        temperatureInput.keyboardType = .decimalPad
        temperatureInput.adjustsFontSizeToFitWidth = true
        temperatureInput.delegate = self
        temperatureInput.addDoneCancelToolbar()
        view.addSubview(temperatureInput)
		
		temperatureInput.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            temperatureInput.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            temperatureInput.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -55),
            temperatureInput.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        return temperatureInput
    }
    
    func addUIBack() -> UIButton {
        let button = UIButton()
        let image = UIImage(named: "cancel")
		button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(pressedBack), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            button.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 16)
        ])
        
        return button
    }
    
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
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return button
    }
    
    func addTempTypeButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Fahrenheit", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(pressedTempType), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: tempInput.centerYAnchor),
            button.leadingAnchor.constraint(equalTo: tempInput.trailingAnchor, constant: 20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return button
    }
    
    func addUIbanner() -> UIButton {
        let label = UIButton()
        label.setBackground(UIColor(named: "blue")!, for: .normal)
        label.setTitleColor(UIColor(named: "off-white")!, for: .normal)
        label.titleLabel?.textAlignment = .center
        if #available(iOS 13.0, *) {
            label.titleLabel?.font = UIFont(descriptor: UIFont.systemFont(ofSize: 20, weight: .bold).fontDescriptor.withDesign(.rounded)!, size: 20)
        } else {
            label.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        }
        label.titleLabel?.adjustsFontSizeToFitWidth = true
        label.contentEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        label.setTitle("Input Recorded Stream Temperature", for: .normal)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            label.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        let menubarview = UIView()
        menubarview.backgroundColor = UIColor(named: "blue")
        view.addSubview(menubarview)
        menubarview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menubarview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menubarview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menubarview.topAnchor.constraint(equalTo: view.topAnchor),
            menubarview.bottomAnchor.constraint(equalTo: label.topAnchor)
        ])
        
        return label
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
