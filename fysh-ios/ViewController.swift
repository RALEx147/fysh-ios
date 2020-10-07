//
//  ViewController.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/18/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController {
	
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	
	var mapview = MGLMapView()
	var menubutton = UIButton()
	var searchbutton = UIButton()
	var inputbutton = UIButton()
	
	var locationDropper = UIImageView()
	var confirmationbutton = UIButton()
	var cancelbutton = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mapview = addUIMapbox()
		menubutton = addUIMenu()
		searchbutton = addUISearch()
		inputbutton = addUIInput()
	}
	
	
	@objc func pressedMenu() {
		print("Menu button tapped")
		print(Data_Model)
	}
	
	@objc func pressedSearch() {
		print("Search button tapped")
		print("Longitude")
	}
	
	@objc func pressedInput() {
		print("Input button tapped")
		confirmationbutton = addUIConfirmButton()
		cancelbutton = addUICancelButton()
		locationDropper = addUILocationDropper()
		hideUIElements()
	}
	
	@objc func pressedConfirm() {
		print("Confirm button tapped")
		locationDropper.removeFromSuperview()
		
		if let location = self.mapview.userLocation?.coordinate{
			let inputTemp = InputTemp()
			inputTemp.location = location
			self.present(inputTemp, animated: true, completion: {
				self.confirmationbutton.removeFromSuperview()
			})
		}
	}
	
	@objc func pressedCancel() {
		print("Cancel button tapped")
		confirmationbutton.removeFromSuperview()
		cancelbutton.removeFromSuperview()
		locationDropper.removeFromSuperview()
		showUIElements()
	}
	
	func hideUIElements() {
		searchbutton.isHidden = true
		menubutton.isHidden = true
		inputbutton.isHidden = true
	}
	
	func showUIElements() {
		searchbutton.isHidden = false
		menubutton.isHidden = false
		inputbutton.isHidden = false
		cancelbutton.removeFromSuperview()
	}
	
}
