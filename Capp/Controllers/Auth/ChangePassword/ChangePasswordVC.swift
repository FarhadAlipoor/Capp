//
//  ChangePasswordVC.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class ChangePasswordVC: MyVC {
    
    let viewModel = ChangePasswordVM()
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var tfNewPassword: MyTextField!
    @IBOutlet weak var tfRepeatPassword: MyTextField!
    
    @IBOutlet weak var vwImageShadow: UIView!
    
    override func viewDidLoad() {
        navigationItem.setHidesBackButton(true, animated:true)
        imgUser.downloadedFrom(link: "http://smartcard.rmto.ir:7003/tto/webservice/get_img/\(StoringData.driverNo ?? 0),RMTO_BAR,r941123")
        vwImageShadow.layer.cornerRadius = vwImageShadow.bounds.height / 2
        imgUser.layer.cornerRadius = imgUser.bounds.height / 2
        imgUser.layer.shadowColor = UIColor.blue.cgColor
        imgUser.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        imgUser.layer.shadowOpacity = 0.5
        imgUser.layer.shadowRadius = imgUser.bounds.height / 2
        imgUser.layer.masksToBounds = false
        title = "ChangePassword".text
    }
    override func viewDidLayoutSubviews() {
        roundCorners(vwMain, corners: [.topLeft , .topRight], radius: 100)
    }
    @IBAction func cancelPressed(_ sender: Any) {
        successToChangePassword()
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        showLoading()
        viewModel.reqToChangePassword(StoringData.driverNo ?? 0, newPassword: tfNewPassword.text ?? "", onSuccess: successToChangePassword, onFailure: failure)
    }
    
    func successToChangePassword() {
        hideLoading()
        actShowSnackbar("رمز عبور شما با موفقیت تغییر کرد", actionTitle: "Done".text)
        let loginVc = Storyboards.auth.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
        navigationController?.pushViewController(loginVc, animated: true)
    }
    
    func roundCorners(_ view: UIView, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
}
