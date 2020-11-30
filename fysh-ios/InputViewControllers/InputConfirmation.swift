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
	
    //Construct done button, back button, and labels for temperature, time, location, and reach for confirmation page. 
	var doneButton = UIButton()
    var backButton = UIButton()
    var banner = UIButton()
	var tempView = UIView()
	var timeView = UIView()
	var locationView = UIView()
	var reachLabel = UILabel()
    var timeLabel = UILabel()
    var tempLabel = UILabel()
	var reachText = String()
	//UIViewController manages a view heirarchy for the confirmation page.
	var presentingController: UIViewController?
	
    //Called when the controller's view is loaded into memory.
	override func viewDidLoad() {
		super.viewDidLoad()
		presentingController = presentingViewController
		
        //Set confirmation page background color to white and render done button, back button, and labels for time, temp, location, and reach.
        view.backgroundColor = UIColor(named: "off-white")
        reachText = calculateReach()
        banner = addUIbanner()
		doneButton = addDoneButton()
        backButton = addUIBack()
        let t = addUITemp()
        tempView = t.view
        tempLabel = t.label
        let k = addUITime()
        timeView = k.view
        timeLabel = k.label
		locationView = addUILocation()
		reachLabel = addUIReach()
		
        //Call calculate reach function to decide what reach ID should be included on the confirmation page.
        reachLabel.text = reachText
	}
	
    //Use latitude and longitde of location pin to decide using GeoJSON data which reach the pin belongs to. If the latitude and longitude are not within a reach, return "Reach: none".
    func calculateReach() -> String {
        let datas = try! geojsonData(from: "map")!
        for data in datas {
            let geojson = try! GeoJSON.parse(FeatureCollection.self, from: data)
            
            for i in geojson.features {
                let p = i.geometry.value as! Polygon
                if p.contains(location) {
                    if let p = i.properties {
                        if let stream = p["Name"]{
                            self.stream = stream as! String
                            return "Reach: \(self.stream)"
                        }
                    }
                }
            }
        }
        return ""
    }
    
    //Get GeoJSON data representing the different reach locations.
	func geojsonData(from name: String) throws -> [Data]? {
        let urls = Bundle.main.urls(forResourcesWithExtension: "geojson", subdirectory: name)
        var datas = [Data]()
        for filePath in urls! {
            try datas.append(Data(contentsOf: filePath))
        }
        return datas
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
        
        
        showLoading()
		DispatchQueue.global(qos: .default).async {
			let result = self.uploadData(temp: String(t), lat: String(self.location.latitude), long: String(self.location.longitude), stream: self.stream, date: date)
            
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
    func uploadData(temp: String, lat: String, long: String, stream: String, date: String) -> DispatchTimeoutResult {
		var appSyncClient: AWSAppSyncClient?
		appSyncClient = appDelegate.appSyncClient
		
		let semaphore = DispatchSemaphore(value: 0)
		
		let query = ListRecordsQuery()
		let UUID = NSUUID().uuidString
		let mutationInput = CreateRecordInput(temp: temp, latitude: lat, longitude: long, time: "", stream: stream, reach: "", date: date)
		appSyncClient?.perform(mutation: CreateRecordMutation(input: mutationInput), optimisticUpdate: { record in
			do{
				try record?.update(query: query){ (data: inout ListRecordsQuery.Data) in
					data.listRecords?.items?.append(ListRecordsQuery.Data.ListRecord.Item.init(id: UUID, temp: temp, latitude: lat, longitude: long, time: "", stream: stream, reach: "", date: date, createdAt: "now", updatedAt: "now"))
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
    
    @objc func pressedEditTime(){
        let alert = UIAlertController(title: "Edit Time", message: "Format (hh:mm:ss)", preferredStyle: .alert)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        alert.addTextField { (textField) in
            textField.text = self.timeLabel.text
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            if let date = dateFormatter.date(from: textField?.text ?? "") {
                self.timeLabel.text = dateFormatter.string(from: date)
                self.time = date
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func pressedEditTemp(){
        let alert = UIAlertController(title: "Edit Temperature", message: "Format (°F)", preferredStyle: .alert)
        alert.addTextField { (textField) in
            let t = self.tempLabel.text!
            let index = t.index(t.endIndex, offsetBy: -4)
            textField.text = String(t[...index])
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            if let t = Double(textField?.text ?? "") {
                self.tempLabel.text = "\(t) °F"
                self.temp = Measurement(value: t, unit: UnitTemperature.fahrenheit)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
