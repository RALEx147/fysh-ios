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
	
	func addUITemp() -> (view: UIView, label: UILabel) {
        let output = UIView()
        output.backgroundColor = UIColor(named: "orange")
        output.alpha = 0.7
        output.layer.cornerRadius = 5
        output.layer.shadowRadius = 3
        output.layer.shadowColor = UIColor.black.cgColor
        output.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        output.layer.shadowOpacity = 0.3
        output.layer.shadowPath = UIBezierPath(rect: output.bounds).cgPath
        output.layer.masksToBounds = false
        view.addSubview(output)
        output.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            output.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            output.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            output.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            output.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 30),
            output.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        let title = UILabel()
        title.textColor = UIColor(named: "off-white")
        title.text = "Temperature"
        output.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 15),
            title.topAnchor.constraint(equalTo: output.topAnchor, constant: 11)
        ])


		let label = UILabel()
		let t = (temp.converted(to: .fahrenheit).value * 100).rounded() / 100
        label.textColor = UIColor(named: "off-white")
		label.text = "\(t) °F"
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		output.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: output.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: output.centerYAnchor)
        ])
        
        let button = UIButton()
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.addTarget(self, action: #selector(pressedEditTemp), for: .touchUpInside)
        output.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: output.trailingAnchor, constant: -15)
        ])
        
        return (output, label)
	}
	
	func addUITime() -> (view: UIView, label: UILabel) {
        let output = UIView()
        output.backgroundColor = UIColor(named: "orange")
        output.alpha = 0.7
        output.layer.cornerRadius = 5
        output.layer.shadowRadius = 3
        output.layer.shadowColor = UIColor.black.cgColor
        output.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        output.layer.shadowOpacity = 0.3
        output.layer.shadowPath = UIBezierPath(rect: output.bounds).cgPath
        output.layer.masksToBounds = false
        view.addSubview(output)
        output.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            output.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            output.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            output.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            output.topAnchor.constraint(equalTo: tempView.bottomAnchor, constant: 20),
            output.heightAnchor.constraint(equalToConstant: 100)
        ])

        let title = UILabel()
        title.textColor = UIColor(named: "off-white")
        title.text = "Time"
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        output.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 15),
            title.topAnchor.constraint(equalTo: output.topAnchor, constant: 11)
        ])

		let label = UILabel()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm:ss"
        label.textColor = UIColor(named: "off-white")
		label.text = dateFormatter.string(from: time)
		output.addSubview(label)

		label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: output.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: output.centerYAnchor)
		])
        
        let button = UIButton()
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.addTarget(self, action: #selector(pressedEditTime), for: .touchUpInside)
        output.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: output.trailingAnchor, constant: -15)
        ])
        
        return (output, label)
	}
	
	func addUILocation() -> UIView {
        let output = UIView()
        output.backgroundColor = UIColor(named: "orange")
        output.alpha = 0.7
        output.layer.cornerRadius = 5
        output.layer.shadowRadius = 3
        output.layer.shadowColor = UIColor.black.cgColor
        output.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        output.layer.shadowOpacity = 0.3
        output.layer.shadowPath = UIBezierPath(rect: output.bounds).cgPath
        output.layer.masksToBounds = false
        view.addSubview(output)
        let height: CGFloat = reachText == "" ? 100 : 150
        output.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            output.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            output.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            output.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            output.topAnchor.constraint(equalTo: timeView.bottomAnchor, constant: 20),
            output.heightAnchor.constraint(equalToConstant: height)
        ])

        let title = UILabel()
        title.textColor = UIColor(named: "off-white")
        title.text = "Location"
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        output.addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: output.leadingAnchor, constant: 15),
            title.topAnchor.constraint(equalTo: output.topAnchor, constant: 11)
        ])

		let label = UILabel()
        label.textColor = UIColor(named: "off-white")
		label.text = "(lat: \((location.latitude * 100000).rounded() / 100000) long: \((location.longitude * 100000).rounded() / 100000))"
		label.adjustsFontSizeToFitWidth = true
		output.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: output.centerXAnchor),
            label.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10)
		])
        
        return output
	}
	
	func addUIReach() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor(named: "off-white")
		label.text = "reach"
		locationView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			label.centerXAnchor.constraint(equalTo: locationView.centerXAnchor),
            label.bottomAnchor.constraint(equalTo: locationView.bottomAnchor, constant: -20)
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
