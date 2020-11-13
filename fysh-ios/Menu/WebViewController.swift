//
//  WebViewController.swift
//  fysh-ios
//
//  Created by Robert Alexander on 11/12/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit
import WebKit

//Creates a place holder web page that we hope to add access to our webpage from the mobile application with.
class WebViewController: UIViewController, WKUIDelegate {
    
    //Constructs an object that displays interactive web content.
    var webView: WKWebView!
    
    //Creates the view that the controller manages.
    override func loadView() {
        
        //Builds the frame that the web page will be viewed in when its button is tapped.
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    //Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the URL to the placeholder, the apple site.
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

}
