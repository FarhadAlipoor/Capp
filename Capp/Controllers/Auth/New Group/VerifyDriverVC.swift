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
    @IBOutlet weak var vwOutside: UIView!
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)

    var driver: JResDriver? = nil
    override func viewDidLoad() {
        setupDriverInfo()
        let panGusture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        view.addGestureRecognizer(panGusture)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        vwOutside.addGestureRecognizer(tap)
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
        if let user = StoringData.user {
            let lastPart = "\(user.cardNo),RMTO_BAR,r941123"
            imgUser.downloadedFrom(link: "http://smartcard.rmto.ir:7003/tto/webservice/get_img/" + lastPart)
        }
    }
    
    @objc func handleTapGesture() {
        dismissMe()
    }
    
    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        
        let touchPoint = sender.location(in: self.view?.window)
        
        if sender.state == UIGestureRecognizerState.began {
            initialTouchPoint = touchPoint
        } else if sender.state == UIGestureRecognizerState.changed {
            if touchPoint.y - initialTouchPoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchPoint.y - initialTouchPoint.y, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        } else if sender.state == UIGestureRecognizerState.ended || sender.state == UIGestureRecognizerState.cancelled {
            if touchPoint.y - initialTouchPoint.y > 100 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
                })
            }
        }
    }
    @IBAction func approvedPressed(_ sender: Any) {
        let registerVC = Storyboards.auth.instantiateViewController(withIdentifier: "registerVC") as! RegisterVC
        let navController = MyNav(rootViewController: registerVC,
                                  patternNavBar: false)
        present(navController, animated: true, completion: nil)
    }
    @IBAction func contradictoryPressed(_ sender: Any) {
        dismissMe()
    }
    
    
}

