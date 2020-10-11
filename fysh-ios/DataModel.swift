//
//  DataModel.swift
//  fysh-ios
//
//  Created by Jack on 10/4/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import Amplify
import AmplifyPlugins
import AWSAppSync

class DataModel: CustomStringConvertible {
	
	//MARK: Properties
	var Records: [Record]
	let appDelegate = UIApplication.shared.delegate as! AppDelegate
	
	public var description: String { return String(self.Records.description) }
	
	init() {
		self.Records = [Record]()
	}
	
	func getRecords(completion: @escaping () -> Void){
		var appSyncClient: AWSAppSyncClient?
		appSyncClient = appDelegate.appSyncClient
		
		let selectQuery = ListRecordsQuery()
		
		let semaphore = DispatchSemaphore(value: 0)
		
		appSyncClient?.fetch(query: selectQuery, cachePolicy: .fetchIgnoringCacheData){(result,error) in
			if error != nil{
				print(error?.localizedDescription ?? "")
				return
			}
			var temp = [Record]()
			result?.data?.listRecords?.items?.forEach{record in
				temp.append(Record(id: record?.id ?? "No ID", temp: record?.temp ?? "No Temp", latitude: record?.latitude ?? "No Lat", longitude: record?.longitude ?? "No Long", time: record?.time ?? "No Time"))
			}
			self.Records = temp
			semaphore.signal()
		}
		_ = semaphore.wait(wallTimeout: .distantFuture)
		completion()
	}
}
