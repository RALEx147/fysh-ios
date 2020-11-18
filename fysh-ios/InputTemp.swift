//
//  InputTemp.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox

//Creates the input temperature view.
class InputTemp: UIViewController, UITextFieldDelegate {
	
    //Construct initial objects for location, temperature input, and buttons
    var location = CLLocationCoordinate2D()
    var tempInput = UITextField()
    var nextButton = UIButton()
	var temp: Measurement<UnitTemperature>!
	var tempType = UIButton()
    var backButton = UIButton()
    
    //UIViewController manages a view heirarchy for the temperature input page.
    var presentingController: UIViewController?

    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        presentingController = presentingViewController
        view.backgroundColor = .white
        

        
        //Sets background color of the main temperature input view.
        view.backgroundColor = .white
        
        //Renders interfaces for temperature input, next button, selection of celcius or fahrenheit, and a back button.
        tempInput = addTextInput()
        nextButton = addNextButton()
		tempType = addTempTypeButton()
        backButton = addUIBack()
        
        //If the user taps outside of the keyboard, the keyboard will be dismissed.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tempInput.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //If a temperature has been inputted into the text field, store the temperature as either celcius or fahrenheit, depending on which option was selected.
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
    
    //Indicates to the textfield that it is no longer immediately needed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //If a user presses the back button, transition back to the previous page.
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromTop
        
        view.window!.layer.add(transition, forKey: nil)
        view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    //If a user presses the next button, proceed to the next stage of inputting data, adding the time that the temperature was taken.
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
	
    //This function is called when a user specifies whether they would like to input their temperature in celcius or fahrenheit. It assigns the correct title to the temperature. 
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
