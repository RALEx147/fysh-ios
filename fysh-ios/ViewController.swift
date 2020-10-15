//
//  ViewController.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/18/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox
import Turf

class ViewController: UIViewController, CLLocationManagerDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var mapview = MGLMapView()
    var menubutton = UIButton()
    var searchbutton = UIButton()
    var inputbutton = UIButton()
    
    var locationDropper = UIImageView()
    var confirmationbutton = UIButton()
    var cancelbutton = UIButton()
    
	let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
		
		locationPermission()
        
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
		let coord = self.mapview.centerCoordinate
		let data = try! self.geojsonData(from: "map")!
		let geojson = try! GeoJSON.parse(FeatureCollection.self, from: data)
//		var polygon = turf.polygon(json.data.features[0].geometry.coordinates, { name: 'poly1', population: 400});
		
		for i in geojson.features {
			let p = i.geometry.value as! Polygon
			print(p.contains(coord))
		}
    }
	
	func geojsonData(from name: String) throws -> Data? {
		guard let path = Bundle.main.path(forResource: name, ofType: "geojson") else {
            return nil
        }
        let filePath = URL(fileURLWithPath: path)
        return try Data(contentsOf: filePath)
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
		
		if let location = self.mapview.userLocation?.coordinate{
			let inputTemp = InputTemp()
			inputTemp.location = location
			self.present(inputTemp, animated: true, completion: {
				self.confirmationbutton.removeFromSuperview()
			})
		}
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
		cancelbutton.removeFromSuperview()
    }
	
	func locationPermission() {
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
	}
    
}
