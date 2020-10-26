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
    
    func addAboutUs()  -> UITextView {//UITextField {
        let theText = NSAttributedString(string: "About Citizen Science Watershed App Project Central Pennsylvania is home to a network of fishable streams and experienced fishermen. Many of these fishermen frequently take temperature data at local streams to predict the water’s current fishability. The Citizen Science Watershed App Project hopes to gather this data from the local fishermen, and extend its meaning to climate change. The data is collected through a mobile application, prioritizing stream location, time and date, and water temperature. This information is then aggregated into mapped reaches of the local streams, and visualized according to their specific location. The mobile application and the website both offer a local map decorated with informational pins indicating recent water temperatures, and the website offers additional visualizations of water temperature fluctuations over time. Civil and Environmental Engineering Faculty at Bucknell University will then use the gathered data to look deeper into climate change and its impacts on central Pennsylvania’s watershed.")
        
        let uiTextView = UITextView()
        uiTextView.frame = CGRect(x: 100, y: 200, width: 300, height: 700)
        uiTextView.attributedText = theText
        
        uiTextView.delegate = self
        self.view.addSubview(uiTextView)
        return uiTextView
    }
    
}
