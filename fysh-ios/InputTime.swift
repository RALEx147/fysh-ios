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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        timePicker = addTimePicker()
        
        
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
