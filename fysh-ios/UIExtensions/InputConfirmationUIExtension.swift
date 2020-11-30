//
//  InputTimeUIExtension.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

//Extends the input confirmation class to create a view that restates the data inputed about time, temperature, and location to be sure it is all correct.
extension InputConfirmation{
    
    //Adds a done button to the confirmation page that the user can select if all of the information is correct.
    func addDoneButton() -> UIButton {
        let button = UIButton()
        button.setBackground(UIColor(named: "blue")!, for: .normal)
        button.setBackground(UIColor(named: "blue-h")!, for: .highlighted)
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
    
    //Adds a back button that the user can select if something is incorrect and they need to edit the time, temperature, or location.
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
	
    //Adds text giving context to the temperature display on the confirmation screen. Tells whether the temperature is in celcius or fahrenheit.
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
	
    //Adds a label to the time displayed on the screen.
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
	
    //Adds a label to the location displayed on the confirmation screen, specifying which number is the latitude, and which is the longitude.
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
	
    //Adds a label to the reach specified on the confirmation page.
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
    
    //Adds the AppIcon to the loading page as the confirmation page saves. 
    func addUILoadingView() -> UIImageView {
        let image = UIImage(named: "AppIcon")
        let imageView = UIImageView(image: image)
        imageView.alpha = 0
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return imageView
    }
    
}
