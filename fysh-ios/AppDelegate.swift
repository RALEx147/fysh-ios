//
//  AppDelegate.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/18/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import Amplify
import AmplifyPlugins
import AWSAppSync

//Set of methods to manage shared behaviors of the application
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var appSyncClient: AWSAppSyncClient?
	var window:UIWindow?
	
    // Attempt to initialize Amplify and client and AppSync configuration, and check for success or failure.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Register UserDefaults to persist settings etc.
        UserDefaults.standard.register(defaults: ["overlaytoggle" : true])
        
        //Override point for customization after application launch.
		let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
		do {
			
			try Amplify.add(plugin:dataStorePlugin)
			try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
			try Amplify.configure()
			print("Initialized Amplify");
		} catch {
			print("Could not initialize Amplify: \(error)")
		}
		
		
		do {
			// You can choose your database location if you wish, or use the default
			let cacheConfiguration = try AWSAppSyncCacheConfiguration()
			
			// AppSync configuration & client initialization
			let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: AWSAppSyncServiceConfig(), cacheConfiguration: cacheConfiguration)
			appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
		} catch {
			print("Error initializing appsync client. \(error)")
		}
		
		return true
	}
	
	
	
}

