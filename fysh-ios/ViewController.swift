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
		
        let url = URL(string: "mapbox://styles/mapbox/streets-v11")
        let mapView = MGLMapView(frame: view.bounds, styleURL: url)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.setCenter(CLLocationCoordinate2D(latitude: 40.957531, longitude: -76.886787), zoomLevel: 13, animated: false)
		mapView.logoView.isHidden = true
		mapView.attributionButton.isHidden = true
        view.addSubview(mapView)
	}


}

