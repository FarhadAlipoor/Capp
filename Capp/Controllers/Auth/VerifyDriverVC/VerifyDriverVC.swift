//
//  VerifyDriverVC.swift
//  Capp
//
//  Created by tannaz on 11/24/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class VerifyDriverVC: MyVC {
    
    @IBOutlet weak var vwImageShadow: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFamilyName: UILabel!
    @IBOutlet weak var lblSmartCard: UILabel!
    @IBOutlet weak var lblStatusInOrg: UILabel!
    @IBOutlet weak var lblNationalCode: UILabel!
    @IBOutlet weak var lblDrivingLicense: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    var driver: JResDriver? = nil
    override func viewDidLoad() {
        setupDriverInfo()
        vwImageShadow.layer.cornerRadius = vwImageShadow.bounds.height / 2
        imgUser.layer.cornerRadius = imgUser.bounds.height / 2
        imgUser.layer.shadowColor = UIColor.blue.cgColor
        imgUser.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        imgUser.layer.shadowOpacity = 0.5
        imgUser.layer.shadowRadius = imgUser.bounds.height / 2
        imgUser.layer.masksToBounds = false
        
    }
    
    func setupDriverInfo() {
        lblName.text = driver?.firstName
        lblFamilyName.text = driver?.lastName
        lblSmartCard.text = "\(driver?.cardNo ?? 0 )".persianDigits()
        lblNationalCode.text = driver?.nationalCode.persianDigits()
        lblDrivingLicense.text = "\(driver?.cardNo ?? 0)".persianDigits()
        if (driver?.isActiveOrg)! {
            lblStatusInOrg.text = "Active".text
        } else {
            lblStatusInOrg.text = "DeActive".text
        }
        imgUser.downloadedFrom(link: "http://smartcard.rmto.ir:7003/tto/webservice/get_img/\(StoringData.driverNo),RMTO_BAR,r941123")
    }
    @IBAction func approvedPressed(_ sender: Any) {
        let registerVC = Storyboards.auth.instantiateViewController(withIdentifier: "registerVC") as! RegisterVC
        let navController = UINavigationController(rootViewController: registerVC)
            present(navController, animated: true, completion: nil)
    }
    @IBAction func contradictoryPressed(_ sender: Any) {
        dismissMe()
    }
    
    
}

