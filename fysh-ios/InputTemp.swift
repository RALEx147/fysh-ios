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
    var temp = Double()
    
    var presentingController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentingController = presentingViewController
        
        
        
        view.backgroundColor = .white
        
        tempInput = addTextInput()
        nextButton = addNextButton()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        tempInput.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        if tempInput.text != "" {
            if let t = Double(tempInput.text!) {
                self.temp = t
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
    
    override func viewWillDisappear(_ animated: Bool) {
        let parent =  self.view.window!.rootViewController as! ViewController
        parent.showUIElements()
    }
    
    @objc func pressedNext(){
        let inputTime = InputTime()
        inputTime.location = self.location
        inputTime.temp = self.temp
        inputTime.modalPresentationStyle = .fullScreen
        
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        
        self.present(inputTime, animated: true, completion: nil)
    }
    
}
