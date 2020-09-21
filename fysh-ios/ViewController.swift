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

	override func viewDidLoad() {
		super.viewDidLoad()
		
		addUIMapbox()
		addUIMenu()
		addUISearch()
		addUIInput()
	}

	@objc func pressedMenu(){
		print("Menu button tapped")
	}
	
	@objc func pressedSearch(){
		print("Search button tapped")
	}
	
	@objc func pressedInput(){
		print("Input button tapped")
	}
	
}

