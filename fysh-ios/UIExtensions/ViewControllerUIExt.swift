//
//  ViewControllerUIExtension.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/20/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Mapbox

//Extends the ViewController class managing the heirarchy of views in the application
extension ViewController {
	
    //Adds the map view with the functionality to track and follow the user's location.
	func addUIMapbox() -> MGLMapView {
		let url = URL(string: "mapbox://styles/mapbox/streets-v11")
		let mapView = MGLMapView(frame: view.bounds, styleURL: url)
		mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		mapView.setCenter(CLLocationCoordinate2D(latitude: 40.957531, longitude: -76.886787), zoomLevel: 13, animated: false)
		mapView.logoView.isHidden = true
        mapView.styleURL = MGLStyle.outdoorsStyleURL
		mapView.attributionButton.isHidden = true
		mapView.showsUserLocation = true
		mapView.userTrackingMode = .follow
		view.addSubview(mapView)
		
		mapView.delegate = self
		
		return mapView
	}
	
    //Adds the menu button to the home page as a generic menu icon at the top right corner. Classifies the action that should be taken if the menu button is tapped by the user.
	func addUIMenu() -> UIButton {
		let button = UIButton()
        let image = UIImage(named: "menu")
		button.setImage(image, for: .normal)
		button.addTarget(self, action: #selector(pressedMenu), for: .touchUpInside)
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
		])
		
		return button
	}
	
    //Adds the location finder button at the bottom right corner of the home page. Classifies that if the user taps this button, the application should recenter the map on the user's detected location.
	func addUILocation() -> UIButton{
		let button = UIButton()
        let image = UIImage(named: "location")
		button.setImage(image, for: .normal)
		button.addTarget(self, action: #selector(pressedLocation), for: .touchUpInside)
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
		])
		return button
	}
	
    //Adds the temperature input button at the bottom right corner of the home page. Classifies that if the user taps this button, the application should navigate to the first portion of the temperature input process.
	func addUIInput() -> UIButton{
		let button = UIButton()
        let image = UIImage(named: "add")
		button.setImage(image, for: .normal)
		button.addTarget(self, action: #selector(pressedInput), for: .touchUpInside)
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
			button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
		])
		
		return button
	}
	
	
	//Adds visible pin to the view that indicates where the location has been dropped when a user selects the option to input a temperature.
	func addUILocationDropper() -> UIImageView{
        let image = UIImage(named: "mappin")
		let imageview = UIImageView(image: image)
		imageview.frame = CGRect(x: 300, y: 300, width: 25, height: 30)
		view.addSubview(imageview)

        let factor = 26399.0428 / pow(view.frame.size.height, 1.2855)
		imageview.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
            imageview.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -image!.size.height/factor),
            imageview.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
        
		return imageview
	}
	
    //Creates the confirmation button to be added to the temperature input pages that allows the user to click forward through the process of providing their location, time, and temperature information.
	func addUIConfirmButton() -> UIButton {
		let button = UIButton()
        button.setBackground(UIColor(named: "blue")!, for: .normal)
        button.setBackground(UIColor(named: "blue-h")!, for: .highlighted)
		button.setTitle("Confirm", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.layer.cornerRadius = 5
		button.clipsToBounds = true
		button.addTarget(self, action: #selector(pressedConfirm), for: .touchUpInside)
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
	
    //Creates the cancel button that can be tapped throughout the temperature input process to allow the user to return to the main page. 
	func addUICancelButton() -> UIButton {
		let button = UIButton()
        let image = UIImage(named: "cancel")
		button.setImage(image, for: .normal)
		button.addTarget(self, action: #selector(pressedCancel), for: .touchUpInside)
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
		])
		
		return button
	}
	
}


