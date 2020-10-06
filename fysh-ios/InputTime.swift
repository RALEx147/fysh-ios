//
//  InputTime.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox

class InputTime: UIViewController {
	
	var location = CLLocationCoordinate2D()
	var temp = 0
	var timePicker = UIDatePicker()
	var nextButton = UIButton()
	
	var presentingController: UIViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presentingController = presentingViewController
		
		self.view.backgroundColor = .white
		timePicker = addTimePicker()
		nextButton = addNextButton()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		self.presentingController?.dismiss(animated: true, completion: nil)
	}
	
	@objc func pressedNext() {
		print("confirmation screen")
		
		let inputConfirmation = InputConfirmation()
		inputConfirmation.location = self.location
		inputConfirmation.temp = self.temp
		inputConfirmation.time = self.timePicker.date
		self.present(inputConfirmation, animated: true, completion: nil)
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destination.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
