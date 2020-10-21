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
	var temp: Measurement<UnitTemperature>!
	var timePicker = UIDatePicker()
	var nextButton = UIButton()
    var backButton = UIButton()
	
	var presentingController: UIViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presentingController = presentingViewController
		self.isModalInPresentation = true

		self.view.backgroundColor = .white
		timePicker = addTimePicker()
		nextButton = addNextButton()
        backButton = addUIBack()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		self.presentingController?.dismiss(animated: false, completion: nil)
	}
	
	@objc func pressedNext() {
		print("confirmation screen")
		
		let inputConfirmation = InputConfirmation()
		inputConfirmation.location = self.location
		inputConfirmation.temp = self.temp
		inputConfirmation.time = self.timePicker.date
        inputConfirmation.modalPresentationStyle = .fullScreen
        
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        
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
    
    @objc func pressedBack(){
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromTop
        
        
        
        self.view.window!.layer.add(transition, forKey: nil)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
	
}
