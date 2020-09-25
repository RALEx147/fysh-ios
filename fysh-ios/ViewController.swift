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

	override func viewDidLoad() {
		super.viewDidLoad()
		
        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 40.957531, longitude: -76.886787), zoomLevel: 13, animated: false)
		mapView.logoView.isHidden = true
		mapView.attributionButton.isHidden = true
        view.addSubview(mapView)
		
		testbackend()
	}
	
	
	func testbackend() {
        let item = Record( id: "877", temp: "60", latitude: "50.2", longitude: "172", time: "5:00 AM")
        
        Amplify.DataStore.save(item) { (result) in
           switch(result) {
           case .success(let savedItem):
               print("Saved item: \(savedItem.temp)")
           case .failure(let error):
               print("Could not save item to datastore: \(error)")
           }
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        var appSyncClient: AWSAppSyncClient?
        
        appSyncClient = appDelegate.appSyncClient
        
        let mutationInput = CreateRecordInput( temp: "test_push", latitude: "56.4", longitude: "123", time: "8:00")

        appSyncClient?.perform(mutation: CreateRecordMutation(input: mutationInput)) { (result, error) in
          if let error = error as? AWSAppSyncClientError {
            print("Error occurred: \(error.localizedDescription )")
          }
          if let resultError = result?.errors {
            print("Error saving the item on server: \(resultError)")
            return
          }
        }
	}


}

