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
		button.backgroundColor = UIColor(red: 0.25, green: 0.65, blue: 1.00, alpha: 1.00)
		button.setTitle("Done", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.layer.cornerRadius = 5
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
	
    
}
