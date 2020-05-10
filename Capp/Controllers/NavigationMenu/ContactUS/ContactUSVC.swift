//
//  ContactUSVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/25/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
import MessageUI
func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true)
}
class ContactUSVC: MyVC , MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var btnEmailUS: MyButton!
    @IBOutlet weak var btnContactUS: MyButton!
    
    override func viewDidLoad() {
        title = "AboutUs".text
    }
    @IBAction func btnContactUSPressed(_ sender: Any) {
        let phoneNumber: String = "tel://+982188501183"
        let url = URL(string: phoneNumber)!
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                // Fallback on earlier versions
            }
            
        }
    }
    @IBAction func btnEmailUSPressed(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["info@capp.com"])
            mail.setMessageBody("", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
}

