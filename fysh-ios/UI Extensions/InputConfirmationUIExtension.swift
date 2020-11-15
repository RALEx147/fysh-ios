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
	
	func addUITempText() -> UILabel {
		let label = UILabel()
		let t = (temp.converted(to: .fahrenheit).value * 10).rounded() / 10
		label.text = "\(t) °F"
		view.addSubview(label)
		
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 50)
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
        label.setTitle("Confirm Accurate Input", for: .normal)
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
