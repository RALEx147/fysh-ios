//
//  ViewController.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/18/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var mapview = MGLMapView()
    var menubutton = UIButton()
    var searchbutton = UIButton()
    var inputbutton = UIButton()
    
    var locationDropper = UIImageView()
    var confirmationbutton = UIButton()
    var cancelbutton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapview = addUIMapbox()
        menubutton = addUIMenu()
        searchbutton = addUISearch()
        inputbutton = addUIInput()
    }
    
    
    @objc func pressedMenu() {
        print("Menu button tapped")
        print(Data_Model)
        let menu = Menu()
        
        menu.modalPresentationStyle = .overCurrentContext
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromLeft
        
        self.view.window!.layer.add(transition, forKey: nil)
        self.present(menu, animated: false)
    }
    
    @objc func pressedSearch() {
        print("Search button tapped")
        print("Longitude")
    }
    
    @objc func pressedInput() {
        print("Input button tapped")
        confirmationbutton = addUIConfirmButton()
        cancelbutton = addUICancelButton()
        locationDropper = addUILocationDropper()
        hideUIElements()
    }
    
    @objc func pressedConfirm() {
        print("Confirm button tapped")
        locationDropper.removeFromSuperview()
        

        
        print(self.mapview.userLocation?.coordinate.latitude)

        
        let location = self.mapview.centerCoordinate
        let inputTemp = InputTemp()
        inputTemp.location = location
        self.present(inputTemp, animated: true, completion: {
            self.confirmationbutton.removeFromSuperview()
        })
        
        
    }
    
    @objc func pressedCancel() {
        print("Cancel button tapped")
        confirmationbutton.removeFromSuperview()
        cancelbutton.removeFromSuperview()
        locationDropper.removeFromSuperview()
        showUIElements()
    }
    
    func hideUIElements() {
        searchbutton.isHidden = true
        menubutton.isHidden = true
        inputbutton.isHidden = true
    }
    
    func showUIElements() {
        searchbutton.isHidden = false
        menubutton.isHidden = false
        inputbutton.isHidden = false
    }
    
}
