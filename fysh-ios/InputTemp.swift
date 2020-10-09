//
//  InputTemp.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox
class InputTemp: UIViewController, UITextFieldDelegate {
	
	var location = CLLocationCoordinate2D()
	var tempInput = UITextField()
	var nextButton = UIButton()
    var temp = 0
	
	var presentingController: UIViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presentingController = presentingViewController
		
		view.backgroundColor = .white
		
		tempInput = addTextInput()
		nextButton = addNextButton()
		
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
		
		//Uncomment the line below if you want the tap not not interfere and cancel other interactions.
		//tap.cancelsTouchesInView = false
		
		view.addGestureRecognizer(tap)
	}
	
	//Calls this function when the tap is recognized.
	@objc func dismissKeyboard() {
		if let t = self.tempInput.text {
			if t != "" {
				self.temp = Int(t)!
			}
		}
		view.endEditing(true)
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		let parent = presentingController as! ViewController
		parent.showUIElements()
	}
	
	@objc func pressedNext(){
		let inputTime = InputTime()
		inputTime.location = self.location
		inputTime.temp = self.temp
		self.present(inputTime, animated: true, completion: nil)
	}
	
}
