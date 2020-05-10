//
//  MyProfileVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/18/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class MyProfileVC: MyVC {
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUserFamily: UILabel!
    @IBOutlet weak var lblCardNo: UILabel!
    @IBOutlet weak var lblNationalCod: UILabel!
    @IBOutlet weak var lblLicenseNo: UILabel!
    @IBOutlet weak var lblStatusInCapp: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var vwShadowImage: UIView!
    
    override func viewDidLoad() {
        title = "MyProfile".text
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupViews()
        
    }
    
    func setupViews() {
        if let user = StoringData.user {
        
        lblUserName.text = user.firstName
        lblUserFamily.text = user.lastName
        lblCardNo.text = String(describing: user.cardNo)
        lblNationalCod.text = String(describing: user.nationalCode)
        lblLicenseNo.text = String(describing: user.licenceNo)
        let lastPart = "\(user.cardNo),RMTO_BAR,r941123"
        imgUser.downloadedFrom(link: "http://smartcard.rmto.ir:7003/tto/webservice/get_img/" + lastPart)
        if (StoringData.user?.isActiveOrg)! {
        lblStatusInCapp.text = "Active".text
        } else {
          lblStatusInCapp.text = "DeActive".text
        }
        }
        vwShadowImage.layer.cornerRadius = vwShadowImage.bounds.height / 2
        imgUser.layer.cornerRadius = imgUser.bounds.height / 2
        imgUser.layer.shadowColor = UIColor.blue.cgColor
        imgUser.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        imgUser.layer.shadowOpacity = 0.5
        imgUser.layer.shadowRadius = imgUser.bounds.height / 2
        imgUser.layer.masksToBounds = false
    }
}
