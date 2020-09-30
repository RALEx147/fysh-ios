//
//  InputTimeUIExtension.swift
//  fysh-ios
//
//  Created by Jack on 9/30/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit
extension InputTime{
    
    func addTimePicker(){
        
        let tp = UIDatePicker()
        tp.datePickerMode = .time
        
        
        self.view.addSubview(tp)
        
        tp.translatesAutoresizingMaskIntoConstraints = false
        tp.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 1)
        ])
        
    }
    
}
