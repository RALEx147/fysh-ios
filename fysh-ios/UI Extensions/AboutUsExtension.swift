//
//  AboutUsExtension.swift
//  fysh-ios
//
//  Created by Katherine Peters on 10/26/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import Foundation
import UIKit

extension AboutUsPage {
    
    func addAboutUsBody()  -> UITextView {//UITextField {
        let aboutUs = NSAttributedString(string: "      Central Pennsylvania is home to a network of fishable streams and experienced fishermen. Many of these fishermen frequently take temperature data at local streams to predict the water’s current fishability. The Citizen Science Watershed App Project hopes to gather this data from the local fishermen, and extend its meaning to climate change. Data is collected through our mobile application, prioritizing stream location, time and date, and water temperature. This information is then aggregated into mapped reaches of the local streams, and visualized according to their specific location. Our mobile application and the website both offer a local map decorated with informational pins indicating recent water temperatures, and the website offers additional visualizations of water temperature fluctuations over time. Civil and Environmental Engineering Faculty at Bucknell University will then use the gathered data to look deeper into climate change and its impacts on central Pennsylvania’s watershed.")
        
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 13, y: 75, width: 300, height: 300)
        uiTextView.attributedText = aboutUs
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 12)
        uiTextView.textAlignment = NSTextAlignment(.center)
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        
        
        return uiTextView
    }
    
    func addAboutUsTitle() -> UITextView {
        let theText = NSAttributedString(string: "About Us")
        let uiTextView = UITextView()
        //uiTextView.frame(.center)
        uiTextView.frame = CGRect(x: 92, y: 20, width: 300, height: 40)
        uiTextView.attributedText = theText
        uiTextView.isScrollEnabled = true
        uiTextView.font = UIFont(name: "Arial", size: 25)
        
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
}
