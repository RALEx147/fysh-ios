//
//  InputTime.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox

//Creates the input time view following the temperature input view.
class InputTime: UIViewController {
	
    //Construct initial objects for location, time suggestion, and next and back buttons.
	var location = CLLocationCoordinate2D()
	var temp: Measurement<UnitTemperature>!
	var timePicker = UIDatePicker()
	var nextButton = UIButton()
    var backButton = UIButton()
	
    //UIViewController manages a view heirarchy for the time input page.
	var presentingController: UIViewController?
	
    //Called when the controller's view is loaded into memory.
	override func viewDidLoad() {
		super.viewDidLoad()
		presentingController = presentingViewController
        //self.isModalInPresentation = true

        //Sets temp input background color to white and renders the time picker, next button, and back button.
		self.view.backgroundColor = .white
		timePicker = addTimePicker()
		nextButton = addNextButton()
        backButton = addUIBack()
	}
	
    //Notifies the controller that its view is about to be removed from a view hierarchy.
	override func viewWillDisappear(_ animated: Bool) {
		self.presentingController?.dismiss(animated: false, completion: nil)
	}
	
    //If the user presses the next button, advance them to the confirmation screen, sending over information about their inputted time, location, and temperature.
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
    
    //If the user presses the back button, bring the view back to the home page.
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
