//
//  VehicleInquiryVC.swift
//  Capp
//
//  Created by tannaz on 12/31/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class VehicleInquiryVC: MyVC , SelectedTrailer {
    
    func configure(_ vehicle: JResVehicleInquiry) {
        viewModel.vehicleDetails = vehicle
    }
    
    let viewModel = VehicleInquiryVM()
    @IBOutlet weak var tfTrailerType: MyTextField!
    @IBOutlet weak var lblPlateNo: UILabel!
    @IBOutlet weak var lblVehicleDocNo: UILabel!
    @IBOutlet weak var lblVehicleCardNo: UILabel!
    @IBOutlet weak var lblStatusInOrg: UILabel!
    @IBOutlet weak var lblVehicleSystem: UILabel!
    var currentTrailer: RTrailerType?
    override func viewDidLoad() {
        setupViews()
        title = "VehicleData".text
    }
    
    func selectTrailer(_ selectedTrailer: RTrailerType) {
        currentTrailer = selectedTrailer
        tfTrailerType.text = selectedTrailer.name
    }
    
    func setupViews() {
        let plateNo = "\(viewModel.vehicleDetails?.plateNo ?? 0)"
        let firstPart = (plateNo[...1])
        let secondPart = (plateNo.subString(startIndex: 4, endIndex: 6))
        lblPlateNo.text = secondPart + "E".text + firstPart + "ایران" + "\(viewModel.vehicleDetails?.plateSerialNo ?? 0)"
        lblVehicleDocNo.text = "\(viewModel.vehicleDetails?.docNomber ?? 0)"
        lblVehicleCardNo.text = "\(viewModel.vehicleDetails?.cardNo ?? 0)"
        if (viewModel.vehicleDetails?.isActiveOrg)! {
          lblStatusInOrg.text = "Active".text
        } else {
         lblStatusInOrg.text = "DeActive".text
        }
        lblVehicleSystem.text = viewModel.vehicleDetails?.systemName ?? ""
        addSlideMenuButton()
    }
    
    @IBAction func btnSubmitPressed(_ sender: Any) {
        if !(tfTrailerType.text?.isEmpty)! {
            showLoading()
        viewModel.requestToSubmitVehicle((viewModel.vehicleDetails?.cardNo)! , trailerTypeId: (currentTrailer?.id)! , onSuccess: successToSubmitVehicle , onFailure: failure)
        } else {
            actShowSnackbar("نوع بارگیر خود را انتخاب کنید", actionTitle: "Close".text)
        }
    }
    func successToSubmitVehicle() {
        hideLoading()
        let chooseServiceTypeVc = Storyboards.main.instantiateViewController(withIdentifier: "chooseServiceTypeVc") as! ChooseServiceTypeVC
        navigationController?.pushViewController(chooseServiceTypeVc, animated: true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfTrailerType {
            let selectableItemsVC = Storyboards.main.instantiateViewController(withIdentifier: "selectableItemsVc") as! SelectableItemsVC
            selectableItemsVC.trailerDelegate = self
            present(selectableItemsVC, animated: false, completion: nil)
            return false
        }
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfTrailerType {
            return false
        } else {
            return true
        }
    }
}
