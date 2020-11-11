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

		view.backgroundColor = .white
		timePicker = addTimePicker()
		nextButton = addNextButton()
        backButton = addUIBack()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		presentingController?.dismiss(animated: false, completion: nil)
	}
	
	@objc func pressedNext() {
		print("confirmation screen")
		
		let inputConfirmation = InputConfirmation()
		inputConfirmation.location = location
		inputConfirmation.temp = temp
		inputConfirmation.time = timePicker.date
        inputConfirmation.modalPresentationStyle = .fullScreen
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        view.window!.layer.add(transition, forKey: nil)
        
		present(inputConfirmation, animated: true, completion: nil)
	}
    
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromTop
        
        view.window!.layer.add(transition, forKey: nil)
        view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
	
}
