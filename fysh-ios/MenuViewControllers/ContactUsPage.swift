//
//  HowToPage.swift
//  fysh-ios
//
//  Created by Katherine on 10/19/20.
//  Copyright © 2020 bucknell-csci479. All rights reserved.
//

import UIKit
import SwiftUI
import MessageUI

//Creates a How To Use the Application page, extended in ContactUsExtension.
class ContactUsPage: UIViewController, MFMailComposeViewControllerDelegate {
    
    var backButton = UIButton()
    var messageReaserchView = UIView()
    var reportBugView = UIView()
    
    
    //Called when the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "menu-color")

        backButton = addUIBack()
        messageReaserchView = addUIMessageResearch()
        reportBugView = addUIReportBug()
    }
    
    @objc func pressedMessageReseach(){
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["mhiggins@bucknell.edu"])
            mail.setMessageBody("<p>Research Inquiry:</p><br>", isHTML: true)

            present(mail, animated: true)
        } else {
            print("Error sending email")
        }
    }
    
    @objc func pressedReportBug(){
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["mhiggins@bucknell.edu"])
            mail.setMessageBody("<p>Bug Report:</p><br>", isHTML: true)

            present(mail, animated: true)
        } else {
            print("Error sending email")
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    
    //If the user presses the back button, bring their view back to the menu on the home page.
    @objc func pressedBack(){
        let transition: CATransition = CATransition()
        transition.duration = 0.3
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        
        self.view.window!.layer.add(transition, forKey: nil)
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    
}
