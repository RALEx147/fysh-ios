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
	var temp: Measurement<UnitTemperature>!
	var tempType = UIButton()
    var backButton = UIButton()
    
    var presentingController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentingController = presentingViewController
        view.backgroundColor = .white

        tempInput = addTextInput()
        nextButton = addNextButton()
		tempType = addTempTypeButton()
        backButton = addUIBack()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tempInput.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        if tempInput.text != "" {
			if let t = Double(tempInput.text!) {
				if tempType.title(for: .normal)! == "Fahrenheit" {
					self.temp = Measurement(value: t, unit: UnitTemperature.fahrenheit)
				} else {
					self.temp = Measurement(value: t, unit: UnitTemperature.celsius)
				}
                nextButton.isEnabled = true
            } else {
                tempInput.text = ""
                nextButton.isEnabled = false
            }
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
    
    @objc func pressedNext(){
        let inputTime = InputTime()
        inputTime.location = location
        inputTime.temp = temp
        inputTime.modalPresentationStyle = .fullScreen
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        view.window!.layer.add(transition, forKey: nil)
        
        present(inputTime, animated: true, completion: nil)
    }
	
    @objc func pressedTempType(){
		if tempType.title(for: .normal) == "Fahrenheit" {
			tempType.setTitle("Celsius", for: .normal)
		} else {
			tempType.setTitle("Fahrenheit", for: .normal)
		}
        if tempInput.text != "" {
            if let t = Double(tempInput.text!) {
                if tempType.title(for: .normal)! == "Fahrenheit" {
                    self.temp = Measurement(value: t, unit: UnitTemperature.fahrenheit)
                } else {
                    self.temp = Measurement(value: t, unit: UnitTemperature.celsius)
                }
            }
        }
    }
	
}
