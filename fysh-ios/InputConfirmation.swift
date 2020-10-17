//
//  InputConfirmation.swift
//  fysh-ios
//
//  Created by Robert Alexander on 10/4/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Mapbox
import Amplify
import AmplifyPlugins
import AWSAppSync

class InputConfirmation: UIViewController {
	
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	
	var location = CLLocationCoordinate2D()
	var temp = Double()
	var time = Date()
	var doneButton = UIButton()
	
	var presentingController: UIViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presentingController = presentingViewController
		self.isModalInPresentation = true
		
		self.view.backgroundColor = .white
		doneButton = addDoneButton()
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		self.presentingController?.dismiss(animated: true, completion: nil)
	}
	
	@objc func pressedDone() {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm"
		let date24 = dateFormatter.string(from: time)
		DispatchQueue.global(qos: .default).async {
			self.uploadData(temp: String(self.temp), lat: String(self.location.latitude), long: String(self.location.longitude), time: date24 )
			
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
	
	
	func uploadData(temp: String, lat: String, long: String, time: String ) {
		var appSyncClient: AWSAppSyncClient?
		appSyncClient = appDelegate.appSyncClient
		
		let semaphore = DispatchSemaphore(value: 0)
		
		let query = ListRecordsQuery()
		let UUID = NSUUID().uuidString
		let mutationInput = CreateRecordInput( temp: temp, latitude: lat, longitude: long, time: time)
		appSyncClient?.perform(mutation: CreateRecordMutation(input: mutationInput), optimisticUpdate: { record in
			
			/*
			Add to the local cache to be pushed later somehow
			*/
			do{
				try record?.update(query: query){ (data: inout ListRecordsQuery.Data) in
					data.listRecords?.items?.append(ListRecordsQuery.Data.ListRecord.Item.init(id: UUID, temp: temp, latitude: lat, longitude: long, time: time, createdAt: "now", updatedAt: "now"))
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
}
