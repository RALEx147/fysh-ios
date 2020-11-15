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
        
        return button
    }
    

    
    func addUIMessageResearch() -> UIView{
        let output = UIView()
        output.backgroundColor = UIColor(named: "off-white")
        output.layer.cornerRadius = 15
        view.addSubview(output)
        output.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            output.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            output.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            output.bottomAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height/2 - 70),
            output.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            output.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        let button = addButton("Messge the Research Team")
        output.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: output.trailingAnchor, constant: -40),
            button.centerXAnchor.constraint(equalTo: output.centerXAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: output.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let title = UILabel()
        title.text = "Message the team"
        title.font = title.font.withSize(24)
        output.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: output.topAnchor, constant: 15)
        ])
        
        let description = UILabel()
        description.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        description.numberOfLines = 0
        description.adjustsFontSizeToFitWidth = true
        output.addSubview(description)
        description.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            description.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 25),
            description.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            description.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            description.trailingAnchor.constraint(equalTo: output.trailingAnchor, constant: -25)
        ])
        
        return output
    }
    
    func addUIReportBug() -> UIView{
        let output = UIView()
        output.backgroundColor = UIColor(named: "off-white")
        output.layer.cornerRadius = 15
        view.addSubview(output)
        output.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            output.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            output.topAnchor.constraint(equalTo: messageReaserchView.bottomAnchor, constant: 70),
            output.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant:  -20),
            output.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            output.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        let button = addButton("Report a Bug")
        output.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: output.trailingAnchor, constant: -40),
            button.centerXAnchor.constraint(equalTo: output.centerXAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: output.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        let title = UILabel()
        title.text = "Report bug"
        title.font = title.font.withSize(24)
        output.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 20),
            title.topAnchor.constraint(equalTo: output.topAnchor, constant: 15)
        ])
        
        let description = UILabel()
        description.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        description.numberOfLines = 0
        description.adjustsFontSizeToFitWidth = true
        output.addSubview(description)
        description.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            description.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 25),
            description.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            description.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            description.trailingAnchor.constraint(equalTo: output.trailingAnchor, constant: -25)
        ])
        
        return output
    }
    
    func addButton(_ str: String) -> UIButton {
        let button = UIButton()
//        button.setImage(UIImage(named: "location"), for: .normal)
        button.setBackground(UIColor(named: "orange")!, for: .normal)
        button.setBackground(UIColor(named: "orange-h")!, for: .highlighted)
        button.setTitle(str, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 5
        button.layer.masksToBounds = false
        
        button.clipsToBounds = true
        if str == "Report a Bug" {
            button.addTarget(self, action: #selector(pressedReportBug), for: .touchUpInside)

        } else {
            button.addTarget(self, action: #selector(pressedMessageReseach), for: .touchUpInside)
        }
        return button
    }
    
}
