//
//  ViewController.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/18/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox

//Manages the view heirarchy of the application.
class ViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //Add menu button, temperature input button, and map view for home page.
    var mapview = MGLMapView()
    var menubutton = UIButton()
    var locationbutton = UIButton()
    var inputbutton = UIButton()
    
    //Add location pin, confirmation button, and cancel button for temperature input pages.
    var locationDropper = UIImageView()
    var confirmationbutton = UIButton()
    var cancelbutton = UIButton()
    
    //The locationManager starts and stops the delivery of location related events to the app, Data_Model stores data, annotations allows points on the map to be associated with a title.
    let locationManager = CLLocationManager()
	var Data_Model = DataModel()
	var annotations = [(id: String, annotation: MGLPointAnnotation)]()
    var overlay: MGLFillStyleLayer!
    var uploadResult:DispatchTimeoutResult! = .success
    
    lazy var slideInTransitioningDelegate = SlideInPresentationManager()
    
    //To add done button to decimal keyboard
    @IBOutlet weak var myNumericTextField: UITextField! {
        didSet { myNumericTextField?.addDoneCancelToolbar() }
    }
	
    //Adds buttons and menu to the main home view. Also adds location permission pop up box.
    override func viewDidLoad() {
        super.viewDidLoad()
		
        onboarding()
        
		locationPermission()
        mapview = addUIMapbox()
        menubutton = addUIMenu()
        locationbutton = addUILocation()
        inputbutton = addUIInput()
    }
    
    func removeOverlay(){
        overlay.isVisible = false
    }
    func addOverlay(){
        overlay.isVisible = true
    }
    
    func onboarding() {
//        if firsttime{
//
///            show help stuff
//        }
    }
    
    //Notifies the view controller that its view is about to be added to view hierarchy.
	override func viewWillAppear(_ animated: Bool) {
        if uploadResult == .success {
            retrieveAnnotations()
        } else if uploadResult == .timedOut {
            let alert = UIAlertController(title: "Connection Timeout", message: "The connection took too long to process, the tempurature data will be uploaded once reconnected.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
        uploadResult = nil
        
		showUIElements()
	}
	
    //Retrieves the assigned titles of dropped location pins, including latitude and longitude from the database.
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
	
    //Loads the assigned annotations of pins including latitude, longitude, stream, and date, for use in confirmation pages.
	func loadAnnotations() -> [(String, MGLPointAnnotation)] {
		var output = [(String, MGLPointAnnotation)]()
		let ids = annotations.map { $0.id }
		
		for i in Data_Model.Records {
			if !ids.contains(i.id) {
				let m = MGLPointAnnotation()
				if let lat = Double(i.latitude!), let long = Double(i.longitude!) {
					let coord = CLLocationCoordinate2D(latitude: lat, longitude: long)
					if coord.latitude != -180.0 && coord.longitude != -180.0 {
						let dateFormatter = DateFormatter()
						dateFormatter.dateFormat = "HH:mm MM/dd"
						let date24 = dateFormatter.string(from: i.date!.foundationDate)
						m.coordinate = coord
						m.title = i.temp + " °F"
                        m.subtitle = "\(date24) \(i.stream == "" ? "" : "Reach: \(i.stream!)")"
						output.append((i.id, m))
					}
				}
			}
		}
		return output
	}
    
    //If a user presses the menu button, transition into menu view with custom presenting style.
    @objc func pressedMenu() {
        let menu = Menu()
        slideInTransitioningDelegate.direction = .left
        menu.transitioningDelegate = slideInTransitioningDelegate
        menu.modalPresentationStyle = .custom
        
        present(menu, animated: true)
    }
    
    //If a user presses the location button,
    @objc func pressedLocation() {
        print(mapview.overlays)
        if let userlocation = mapview.userLocation?.coordinate{
            mapview.setCenter(userlocation, animated: true)
        }
    }
    
    //If a user presses the input temperature button, add the confirmation button, the canel button, and the location dropper to the view and hide UI elements of home page to transition to a relevant location input view.
    @objc func pressedInput() {
        print("Input button tapped")
        confirmationbutton = addUIConfirmButton()
        cancelbutton = addUICancelButton()
        locationDropper = addUILocationDropper()
        hideUIElements()
    }
    
    //If the user presses the confirm button, remove the location pin from the view, assign the temperature and location on the presented temperature input screen. Remove the confirmation button from the screen after it is tapped.
 	@objc func pressedConfirm() {
		print("Confirm button tapped")
		locationDropper.removeFromSuperview()
	
		let inputTemp = InputTemp()
		inputTemp.location = mapview.centerCoordinate
		inputTemp.modalPresentationStyle = .fullScreen
        
		let transition: CATransition = CATransition()
		transition.duration = 0.5
		transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
		transition.subtype = CATransitionSubtype.fromBottom
		view.window!.layer.add(transition, forKey: nil)
        
		present(inputTemp, animated: false, completion: {
			self.confirmationbutton.removeFromSuperview()
		})
	}
    
    //If the user presses cancel, remove the confirmation button, cancel button, and location dropper from the view. Call showUIElements() to bring the homescreen back as the view.
    @objc func pressedCancel() {
        print("Cancel button tapped")
        confirmationbutton.removeFromSuperview()
        cancelbutton.removeFromSuperview()
        locationDropper.removeFromSuperview()
        showUIElements()
    }
    
    //This function is called when a user action prompts the app to leave the home page.
    func hideUIElements() {
        locationbutton.isHidden = true
        menubutton.isHidden = true
        inputbutton.isHidden = true
    }
    
    //This function is called when a user action prompts the app to return to the home page.
    func showUIElements() {
        locationbutton.isHidden = false
        menubutton.isHidden = false
        inputbutton.isHidden = false
		cancelbutton.removeFromSuperview()
    }
	
    //This function is called when the initial view is rendered on the app to ask the user if they give permission to the applciation to have access to their location.
	func locationPermission() {
        // Ask for Authorisation from the User.
        locationManager.requestAlwaysAuthorization()
        // For use in foreground
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
	}

    
}
