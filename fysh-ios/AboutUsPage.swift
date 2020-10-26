//
//  AboutUsPage.swift
//  fysh-ios
//
//  Created by Jack on 10/15/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import SwiftUI

class AboutUsPage: UIViewController {
    
    @State private var text = ""
    
    var body: some View {
        Text("Hi").font(.largeTitle).foregroundColor(.red).fontWeight(.black)
        //TextField("blah", text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //let aboutUsText = UITextView()
        //aboutUsText.textColor = .black
        //aboutUsText.text = "About Citizen Science Watershed App Project Central Pennsylvania is home to a network of fishable streams and experienced fishermen. Many of these fishermen frequently take temperature data at local streams to predict the water’s current fishability. The Citizen Science Watershed App Project hopes to gather this data from the local fishermen, and extend its meaning to climate change. The data is collected through a mobile application, prioritizing stream location, time and date, and water temperature. This information is then aggregated into mapped reaches of the local streams, and visualized according to their specific location. The mobile application and the website both offer a local map decorated with informational pins indicating recent water temperatures, and the website offers additional visualizations of water temperature fluctuations over time. Civil and Environmental Engineering Faculty at Bucknell University will then use the gathered data to look deeper into climate change and its impacts on central Pennsylvania’s watershed."
        
        //view.addSubview(aboutUsText)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
