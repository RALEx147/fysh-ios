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
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return button
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
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        return button
    }
	
	func addUITempText() -> UILabel {
		let label = UILabel()
		let t = (temp.converted(to: .fahrenheit).value * 10).rounded() / 10
		label.text = "\(t) °F"
		view.addSubview(label)
		
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
			label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
        
        return label
	}
	
	func addUITimeText() -> UILabel {
		let label = UILabel()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm:ss"
		let date24 = dateFormatter.string(from: time)
		label.text = "Time: \(date24)"
		view.addSubview(label)

		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
			label.topAnchor.constraint(equalTo: self.textTemp.bottomAnchor, constant: 50)
		])
        
        return label
	}
	
	func addUILocationText() -> UILabel {
		let label = UILabel()
		label.text = "(lat: \(location.latitude) long: \(location.longitude))"
		label.adjustsFontSizeToFitWidth = true
		view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
			label.topAnchor.constraint(equalTo: self.textTime.bottomAnchor, constant: 50),
			label.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.95)
		])
        
        return label
	}
	
	func addUIReachText() -> UILabel {
		let label = UILabel()
		label.text = "reach"
		view.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
			label.topAnchor.constraint(equalTo: self.textLocation.bottomAnchor, constant: 50)
		])
        
        return label
	}
    
    
}
