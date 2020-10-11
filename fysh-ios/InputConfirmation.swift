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
        
        uploadData(temp: String(temp), lat: String(location.latitude), long: String(location.longitude), time: date24 )
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromRight
        
        self.view.window!.layer.add(transition, forKey: nil)
        
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    func uploadData(temp: String, lat: String, long: String, time: String ) {
        var appSyncClient: AWSAppSyncClient?
        appSyncClient = appDelegate.appSyncClient
        let mutationInput = CreateRecordInput( temp: temp, latitude: lat, longitude: long, time: time)
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
