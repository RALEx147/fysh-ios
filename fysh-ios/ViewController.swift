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


	override func viewDidLoad() {
		super.viewDidLoad()
		
		addUIMapbox()
		addUIMenu()
		addUISearch()
		addUIInput()
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
	}
	
	@objc func pressedInput(){
		print("Input button tapped")
	}
	
}

