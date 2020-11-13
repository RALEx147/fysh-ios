//
//  InputConfirmation.swift
//  fysh-ios
//
//  Created by Robert Alexander on 10/4/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox
import AmplifyPlugins
import AWSAppSync
import Turf
import Foundation

//Creates the input confirmation page following the temperature and time input pages.
class InputConfirmation: UIViewController {
	
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //Construct initial objects for location, temperature, time, stream name, and reach ID.
	var location = CLLocationCoordinate2D()
	var temp: Measurement<UnitTemperature>!
	var time = Date()
	var stream = String()
	var reach = String()
	
    //Construct done button, back button, and labels for temperature, time, location, and reach for confirmation page. 
	var doneButton = UIButton()
    var backButton = UIButton()
//    var loadingView = UIImageView()
	
	var textTemp = UILabel()
	var textTime = UILabel()
	var textLocation = UILabel()
	var textReach = UILabel()
	
	//UIViewController manages a view heirarchy for the confirmation page.
	var presentingController: UIViewController?
	
    //Called when the controller's view is loaded into memory.
	override func viewDidLoad() {
		super.viewDidLoad()
		presentingController = presentingViewController

		
        //Set confirmation page background color to white and render done button, back button, and labels for time, temp, location, and reach.
        view.backgroundColor = .white
		doneButton = addDoneButton()
        backButton = addUIBack()

		
		textTemp = addUITempText()
		textTime = addUITimeText()
		textLocation = addUILocationText()
		textReach = addUIReachText()
		
        //Call calculate reach function to decide what reach ID should be included on the confirmation page.
		textReach.text = calculateReach()
	}
	
    //Use latitude and longitde of location pin to decide using GeoJSON data which reach the pin belongs to. If the latitude and longitude are not within a reach, return "Reach: none".
	func calculateReach() -> String {
		let data = try! geojsonData(from: "map")!
		let geojson = try! GeoJSON.parse(FeatureCollection.self, from: data)
		
		for i in geojson.features {
			let p = i.geometry.value as! Polygon
			if p.contains(location) {
				if let p = i.properties {
					if let stream = p["stream"], let reach = p["reach"] {
						self.stream = stream as! String
						self.reach = reach as! String
						return "Reach: \(self.stream)\(self.reach)"
					}
				}
			}
		}
		return "Reach: none"
	}
	
    //Get GeoJSON data representing the different reach locations.
	func geojsonData(from name: String) throws -> Data? {
		guard let path = Bundle.main.path(forResource: name, ofType: "geojson") else {
            return nil
        }
        let filePath = URL(fileURLWithPath: path)
        return try Data(contentsOf: filePath)
    }
	
    //Notifies the controller that its view is about to be removed from a view hierarchy.
	override func viewWillDisappear(_ animated: Bool) {
		presentingController?.dismiss(animated: true, completion: nil)
	}
    
    func showLoading() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating()

        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
	
    //If the user presses the done button, they have confirmed their input is correct. Add the date, latitude and longitude, time, and temperature to the queue.
	@objc func pressedDone() {
		let iso8601DateFormatter = ISO8601DateFormatter()
		iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
		let date = iso8601DateFormatter.string(from: time)
		let t = (temp.converted(to: .fahrenheit).value * 10).rounded() / 10
        
//        UIView.animate(withDuration: 1) {
//            self.loadingView.alpha = 1
//        }
        showLoading()
		DispatchQueue.global(qos: .default).async {
			let result = self.uploadData(temp: String(t), lat: String(self.location.latitude), long: String(self.location.longitude), stream: self.stream, reach: self.reach, date: date)
            
			DispatchQueue.main.async {
				let transition: CATransition = CATransition()
				transition.duration = 0.5
				transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
				transition.type = CATransitionType.reveal
				transition.subtype = CATransitionSubtype.fromRight
				
                if let p = self.view.window!.rootViewController as? ViewController {
                    p.uploadResult = result
                }
                
				self.view.window!.layer.add(transition, forKey: nil)
				self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
			}
		}
		
	}
    
    //Upload data from the DispatchQueue, sending the data through the backend to the web application.
    func uploadData(temp: String, lat: String, long: String, stream: String, reach: String, date: String) -> DispatchTimeoutResult {
		var appSyncClient: AWSAppSyncClient?
		appSyncClient = appDelegate.appSyncClient
		
		let semaphore = DispatchSemaphore(value: 0)
		
		let query = ListRecordsQuery()
		let UUID = NSUUID().uuidString
		let mutationInput = CreateRecordInput(temp: temp, latitude: lat, longitude: long, time: "", stream: stream, reach: reach, date: date)
		appSyncClient?.perform(mutation: CreateRecordMutation(input: mutationInput), optimisticUpdate: { record in
			do{
				try record?.update(query: query){ (data: inout ListRecordsQuery.Data) in
					data.listRecords?.items?.append(ListRecordsQuery.Data.ListRecord.Item.init(id: UUID, temp: temp, latitude: lat, longitude: long, time: "", stream: stream, reach: reach, date: date, createdAt: "now", updatedAt: "now"))
				}
			}catch{
				print("Error updating cache with optimistic response for")
			}
			
		}, resultHandler: { (result, error) in
			if let error = error as? AWSAppSyncClientError {
				print("Error occurred: \(error.localizedDescription )")
			}
			if let resultError = result?.errors {
				print("Error saving the item on server: \(resultError)")
				return
			}
            if result != nil{
				let _ = appSyncClient?.store?.withinReadWriteTransaction { record in
					try record.update(query: ListRecordsQuery())
					{ (data: inout ListRecordsQuery.Data) in
						var pos = -1, counter = 0
						for item in (data.listRecords?.items!)! {
							if item?.id == UUID {
								pos = counter
								continue
							}; counter += 1
						}
						if pos != -1 { data.listRecords?.items?.remove(at: pos) }
						
					}
				}
                semaphore.signal()
			}
		})
		return semaphore.wait(wallTimeout: .now() + 5)
	}
    
    //If the user presses the back button, return the view to the home page. 
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromTop
        
        view.window!.layer.add(transition, forKey: nil)
        view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
}
