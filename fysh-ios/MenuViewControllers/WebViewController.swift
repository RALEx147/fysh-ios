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
    var safariButton: UIButton!
    let url: URL = URL(string: "http://localhost:3000")!
    
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
        let myRequest = URLRequest(url: url)
        webView.load(myRequest)
        
        safariButton = addUIButton()
    }

    @objc func showInSafari() {
        UIApplication.shared.open(url)
    }
    
    func addUIButton() -> UIButton {
        let button = UIButton()
        button.setBackground(UIColor(named: "blue")!, for: .normal)
        button.setBackground(UIColor(named: "blue-h")!, for: .highlighted)
        button.setTitle("Show in Safari", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(showInSafari), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        return button
    }
    
}
