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
class DataModel {
    
    //MARK: Properties
    var Records: [Record]
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    init() {
        self.Records = [Record]()
    }
    
    
    func getRecords(){
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
}
