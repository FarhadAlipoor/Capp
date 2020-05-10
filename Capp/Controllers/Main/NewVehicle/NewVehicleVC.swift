//
//  NewVehicleVC.swift
//  Capp
//
//  Created by tannaz on 12/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class NewVehicleVC: MyVC {
    
    let viewModel = NewCehicleVM()
    @IBOutlet weak var tfVehicleCardNom: MyTextField!

    @IBOutlet weak var tfFirstPlateNo: UITextField!
    @IBOutlet weak var tfSecondPlateNom: UITextField!
    @IBOutlet weak var tfPlateSerialNom: UITextField!
    
    var haveVehicle: Bool? = true
    
    override func viewDidLoad() {
        title = "AddNewVehicle".text
        if haveVehicle! {
        addSlideMenuButton()
        }
    }
    
    @IBAction func btnInqueryVehiclePressed(_ sender: Any) {
        let plate = tfFirstPlateNo.text! + "11" + tfSecondPlateNom.text!
        let plateNo =  plate.toInt()
        showLoading()
        viewModel.requestToInquiryVehicle(plateNo, plateSerialNo: (tfPlateSerialNom.text?.toInt())!, vehicleCardNo: (tfVehicleCardNom.text?.toInt())!, onSuccess: successToInquiryVehicle, onFailure: failure)

    }
    
    override func failure(_ response: JResponse?) {
        tfVehicleCardNom.text = ""
        tfSecondPlateNom.text = ""
        tfPlateSerialNom.text = ""
        tfVehicleCardNom.text = ""
    }
    
    @IBAction func tfChanged(_ sender: Any) {
//        let tf = sender as! UITextField
//        if tf.text?.characters.count ?? 0 > 2 {
//            // next character
//            tf.text = tf.text?.persianDigits()
//            _ = textFieldShouldReturn(tf)
//            if tf == tfPlateSerialNom {
//                // plateNo is seem complete
//            }
//    }
    }
    func successToInquiryVehicle() {
        hideLoading()
        let vehicleInquiryVc = Storyboards.main.instantiateViewController(withIdentifier: "vehicleInquiryVc") as! VehicleInquiryVC
        vehicleInquiryVc.configure(viewModel.vehicleInquiry!)
        navigationController?.pushViewController(vehicleInquiryVc, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfVehicleCardNom {
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 7
        }
        if textField == tfSecondPlateNom {
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 3
        }
        if textField == tfFirstPlateNo || textField == tfPlateSerialNom {
            guard let text = textField.text else { return true }
            let newLength = text.characters.count + string.characters.count - range.length
            return newLength <= 2
        } else {
            return true
        }
    }
}
