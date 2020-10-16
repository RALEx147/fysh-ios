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
	var Data_Model = DataModel()
	var annotations = [(id: String, annotation: MGLPointAnnotation)]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		retrieveAnnotations()
		
		locationPermission()
        mapview = addUIMapbox()
        menubutton = addUIMenu()
        searchbutton = addUISearch()
        inputbutton = addUIInput()
    }
	
	func retrieveAnnotations() {
		DispatchQueue.global(qos: .utility).async {
			self.Data_Model.getRecords {
				print("finished retrieving (total): \(self.Data_Model.Records.count)")
				let databaseAnnotations = self.loadAnnotations()
				print("finished filtering (total): \(databaseAnnotations)")
				self.annotations.append(contentsOf: databaseAnnotations)
			}

			DispatchQueue.main.async {
				var databaseAnnotations: [MGLPointAnnotation] = self.annotations.map { $0.annotation }
				let currentAnnotations: [MGLAnnotation] = self.mapview.annotations ?? [MGLAnnotation]()
				
				for i in currentAnnotations {
					databaseAnnotations = databaseAnnotations.filter({ (point) -> Bool in
						return point.coordinate.latitude != i.coordinate.latitude && point.coordinate.longitude != i.coordinate.longitude
					})
				}
				
				self.mapview.addAnnotations(databaseAnnotations)
			}
		}
	}
	
	func loadAnnotations() -> [(String, MGLPointAnnotation)] {
		var output = [(String, MGLPointAnnotation)]()
		let ids = self.annotations.map { $0.id }
		
		for i in self.Data_Model.Records {
			if !ids.contains(i.id) {
				let m = MGLPointAnnotation()
				if let lat = Double(i.latitude!), let long = Double(i.longitude!) {
					let coord = CLLocationCoordinate2D(latitude: lat, longitude: long)
					if coord.latitude != -180.0 && coord.longitude != -180.0 {
						m.coordinate = coord
						m.title = i.temp + " °F"
						m.subtitle = i.time!
						output.append((i.id, m))
					}
				}
			}
		}
		return output
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
		
		let inputTemp = InputTemp()
		inputTemp.location = self.mapview.centerCoordinate
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
