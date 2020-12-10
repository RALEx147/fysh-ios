//
//  ContactUsExtension.swift
//  fysh-ios
//
//  Created by Robert Alexander on 11/13/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

//Extends the settings page on the menu, offering users the options to turn overlays of stream reaches on and off.
extension SettingsPage {
    
    //Adds a back button that takes the user back to the menu when they are finished on the settings page.
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
        
        return button
    }
    
    //Adds a toggle button that allows the user to turn stream reach overlays on and off on the settings page.
    func addUIOverlayToggle() -> (view: UIView, switch: UISwitch) {
        let output = UIView()
        output.backgroundColor = UIColor(named: "off-white")
        output.layer.cornerRadius = 10
        view.addSubview(output)
        output.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            output.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            output.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            output.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            output.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            output.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        //Sets the label of the toggle button to "Stream Reach Overlay"
        let label = UILabel()
        label.text = "Stream Reach Overlay"
        output.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: output.centerYAnchor)
        ])
        
        //Sets the button type to UISwitch, since there is only an option to have the reach overlays either off or on.
        let button = UISwitch()
        button.isOn = showReachOverlays
        button.addTarget(self, action: #selector(pressedOverlayToggle), for: .valueChanged)
        output.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: output.trailingAnchor, constant: -10),
            button.centerYAnchor.constraint(equalTo: output.centerYAnchor)
        ])
        
        return (output, button)
    }
    
    //Adds the app version to the settings page. 
    func addUIVersion() -> UILabel {
        let label = UILabel()
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            label.text = "Version: \(version)"
        }
        label.textColor = UIColor(named: "off-white")
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        return label
    }
    
}
