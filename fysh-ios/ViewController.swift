//
//  ViewController.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/18/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox
import Amplify
import AmplifyPlugins
import AWSAppSync

class ViewController: UIViewController {
	
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	
	var mapview = MGLMapView()
	var menubutton = UIButton()
	var searchbutton = UIButton()
	var inputbutton = UIButton()
	
	var confirmationbutton = UIButton()
	var cancelbutton = UIButton()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		mapview = addUIMapbox()
		menubutton = addUIMenu()
		searchbutton = addUISearch()
		inputbutton = addUIInput()
	}
	
	func testbackend() {
		var appSyncClient: AWSAppSyncClient?
		appSyncClient = appDelegate.appSyncClient
		let mutationInput = CreateRecordInput( temp: "656", latitude: "56.4", longitude: "123", time: "8:00")
		appSyncClient?.perform(mutation: CreateRecordMutation(input: mutationInput)) { (result, error) in
			if let error = error as? AWSAppSyncClientError {
				print("Error occurred: \(error.localizedDescription )")
			}
			if let resultError = result?.errors {
				print("Error saving the item on server: \(resultError)")
				return
			}
		}
		print("success")
	}
	
	@objc func pressedMenu(){
		print("Menu button tapped")
		testbackend()
	}
	
	@objc func pressedSearch(){
		print("Search button tapped")
        print("Longitude")
        print( mapview.userLocation?.coordinate )
	}
	
	@objc func pressedInput(){
		print("Input button tapped")
		confirmationbutton = addUIConfirmButton()
		cancelbutton = addUICancelButton()
		hideUIElements()
	}
	
	@objc func pressedConfirm(){
		print("Confirm button tapped")
        let inputTemp = InputTemp()
        inputTemp.location = self.mapview.userLocation?.coordinate as! CLLocationCoordinate2D
        self.present(inputTemp, animated: true, completion: nil)
	}
	
	@objc func pressedCancel(){
		print("Cancel button tapped")
		confirmationbutton.removeFromSuperview()
		cancelbutton.removeFromSuperview()
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
