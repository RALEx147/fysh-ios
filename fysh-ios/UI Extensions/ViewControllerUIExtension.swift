//
//  ViewControllerUIExtension.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/20/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Mapbox

extension ViewController {
	
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
	
	func addUIMenu() -> UIButton {
		let button = UIButton()
		let image = UIImage(systemName: "line.horizontal.3", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
		button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
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
	
	func addUISearch() -> UIButton{
		let button = UIButton()
		let image = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.systemGray, renderingMode: .alwaysOriginal)
		button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
		button.setImage(image, for: .normal)
		button.addTarget(self, action: #selector(pressedSearch), for: .touchUpInside)
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
			button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
		])
		return button
	}
	
	func addUIInput() -> UIButton{
		let button = UIButton()
		let image = UIImage(systemName: "plus.app.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 55))?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
		button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
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
	
	
	//MARK: - Location UI
	func addUILocationDropper() -> UIImageView{
		let image = UIImage(systemName: "mappin", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
		let imageview = UIImageView(image: image)
		imageview.frame = CGRect(x: 300, y: 300, width: 25, height: 30)
		view.addSubview(imageview)
		
		imageview.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			imageview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: view.frame.size.width/2 - image!.size.width/2),
			imageview.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height/2 - image!.size.height/1.4)
		])
        
		
		return imageview
	}
	
	func addUIConfirmButton() -> UIButton {
		let button = UIButton()
		button.setBackground(UIColor(red: 0.25, green: 0.65, blue: 1.00, alpha: 1.00), for: .normal)
		button.setBackground(UIColor(red: 0.25, green: 0.45, blue: 1.00, alpha: 1.00), for: .highlighted)
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
	
	func addUICancelButton() -> UIButton {
		let button = UIButton()
		let image = UIImage(systemName: "xmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
		button.frame = CGRect(x: 0, y: 0, width: image!.size.width, height: image!.size.height)
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


