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
    var temp = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       tempInput = addTextInput()
        addNextButton()
        
            let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
            //tap.cancelsTouchesInView = false

            view.addGestureRecognizer(tap)
        }

        //Calls this function when the tap is recognized.
        @objc func dismissKeyboard() {
            //Causes the view (or one of its embedded text fields) to resign the first responder status.
			
			if let t = self.tempInput.text {
				if t != "" {
					self.temp = Int(t)!
				}
			}
            view.endEditing(true)
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func pressedNext(){
    
        let inputTime = InputTime()
        inputTime.location = self.location
        inputTime.temp = self.temp
        self.present(inputTime, animated: true, completion: nil)
        
        }
    
    
    

}
