//
//  ContentView.swift
//  fysh-ios
//
//  Created by Robert Alexander on 9/9/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import SwiftUI
import Amplify
import AmplifyPlugins
import AWSAppSync

struct ContentView: View {
    @State private var selection = 0
    

    var body: some View {
        
        
        TabView(selection: $selection){
            Text("First View")
                .font(.title)
                .onAppear{
                    self.performOnAppear()
                }
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
        }
    }
    
    func performOnAppear() {
        let item = Record( id: "877", temp: "60", latitude: "50.2", longitude: "172", time: "5:00 AM")
        
        Amplify.DataStore.save(item) { (result) in
           switch(result) {
           case .success(let savedItem):
               print("Saved item: \(savedItem.temp)")
           case .failure(let error):
               print("Could not save item to datastore: \(error)")
           }
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        var appSyncClient: AWSAppSyncClient?
        
        appSyncClient = appDelegate.appSyncClient
        
        let mutationInput = CreateRecordInput( temp: "66", latitude: "56.4", longitude: "123", time: "8:00")

        appSyncClient?.perform(mutation: CreateRecordMutation(input: mutationInput)) { (result, error) in
          if let error = error as? AWSAppSyncClientError {
            print("Error occurred: \(error.localizedDescription )")
          }
          if let resultError = result?.errors {
            print("Error saving the item on server: \(resultError)")
            return
          }
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    

}
