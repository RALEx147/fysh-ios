//
//  InputTemp.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit

class InputTemp: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addTextInput()
        // Do any additional setup after loading the view.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func addTextInput(){
        let temperatureInput =  UITextField(frame: CGRect(x: 20, y: 10, width: 300, height: 40))
        temperatureInput.placeholder = "Enter temp here"
        temperatureInput.font = UIFont.systemFont(ofSize: 15)
        temperatureInput.borderStyle = UITextField.BorderStyle.roundedRect
        temperatureInput.autocorrectionType = UITextAutocorrectionType.no
        temperatureInput.keyboardType = UIKeyboardType.default
        temperatureInput.returnKeyType = UIReturnKeyType.done
        temperatureInput.clearButtonMode = UITextField.ViewMode.whileEditing
        temperatureInput.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        temperatureInput.delegate = self
        self.view.addSubview(temperatureInput)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(textField.text)
        textField.resignFirstResponder()
        return true
    }
    

}
