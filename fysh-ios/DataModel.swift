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
		
		appSyncClient?.fetch(query: selectQuery, cachePolicy: .fetchIgnoringCacheData){(result,error) in
			if error != nil{
				print(error?.localizedDescription ?? "")
				return
			}
			result?.data?.listRecords?.items?.forEach{record in
				self.Records.append(Record(id: record?.id ?? "No ID", temp: record?.temp ?? "No Temp", latitude: record?.latitude ?? "No Lat", longitude: record?.longitude ?? "No Long", time: record?.time ?? "No Time"))
			}
		}
		completion()
	}
}
