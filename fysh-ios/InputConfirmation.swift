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


class InputConfirmation: UIViewController {
	
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	
	var location = CLLocationCoordinate2D()
	var temp: Measurement<UnitTemperature>!
	var time = Date()
	var stream = String()
	var reach = String()
	
	var doneButton = UIButton()
    var backButton = UIButton()
	
	var textTemp = UILabel()
	var textTime = UILabel()
	var textLocation = UILabel()
	var textReach = UILabel()
	
	
	var presentingController: UIViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presentingController = presentingViewController
		self.isModalInPresentation = true
		
		self.view.backgroundColor = .white
		doneButton = addDoneButton()
        backButton = addUIBack()
		
		textTemp = addUITempText()
		textTime = addUITimeText()
		textLocation = addUILocationText()
		textReach = addUIReachText()
		
		textReach.text = calculateReach()
	}
	
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
	
	func geojsonData(from name: String) throws -> Data? {
		guard let path = Bundle.main.path(forResource: name, ofType: "geojson") else {
            return nil
        }
        let filePath = URL(fileURLWithPath: path)
        return try Data(contentsOf: filePath)
    }
	
	override func viewWillDisappear(_ animated: Bool) {
		self.presentingController?.dismiss(animated: true, completion: nil)
	}
	
	@objc func pressedDone() {
		let iso8601DateFormatter = ISO8601DateFormatter()
		iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
		let date = iso8601DateFormatter.string(from: time)
		let t = (self.temp.converted(to: .fahrenheit).value * 10).rounded() / 10
		DispatchQueue.global(qos: .default).async {
			self.uploadData(temp: String(t), lat: String(self.location.latitude), long: String(self.location.longitude), stream: self.stream, reach: self.reach, date: date)
			
			DispatchQueue.main.async {
				let transition: CATransition = CATransition()
				transition.duration = 0.5
				transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
				transition.type = CATransitionType.reveal
				transition.subtype = CATransitionSubtype.fromRight
				
				self.view.window!.layer.add(transition, forKey: nil)
				self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
			}
		}
		
	}
	
	
	func uploadData(temp: String, lat: String, long: String, stream: String, reach: String, date: String) {
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
			
			semaphore.signal()
			
		}, resultHandler: { (result, error) in
			if let error = error as? AWSAppSyncClientError {
				print("Error occurred: \(error.localizedDescription )")
			}
			if let resultError = result?.errors {
				print("Error saving the item on server: \(resultError)")
				return
			}
			if let result = result{
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
			}
		})
		_ = semaphore.wait(wallTimeout: .now() + 5)
	}
    
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromTop
        
        
        
        self.view.window!.layer.add(transition, forKey: nil)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
}
