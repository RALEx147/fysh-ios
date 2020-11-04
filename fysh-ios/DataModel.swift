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
			do{
				try result?.data?.listRecords?.items?.forEach{record in
					temp.append(Record(id: record?.id ?? "", temp: record?.temp ?? "", latitude: record?.latitude!, longitude: record?.longitude!, time: record?.time!, stream: record?.stream, reach:  record?.reach, date: try               Temporal.DateTime(iso8601String: (record?.date ?? "1970-01-01T00:00:00.0000000Z"))))
				}
			} catch {
				print("Temporal.DateTime(iso8601String) error")
			}
			self.Records = temp
			semaphore.signal()
		}
		_ = semaphore.wait(wallTimeout: .distantFuture)
		completion()
	}
}
