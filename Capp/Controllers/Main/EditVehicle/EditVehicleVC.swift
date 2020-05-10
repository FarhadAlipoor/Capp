//
//  EditVehicleVC.swift
//  Capp
//
//  Created by tannaz on 12/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class EditVehicleVC: MyVC {
    
    var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)

    func configure(_ vehicle: JVehicle , trailer: RTrailerType) {
        viewModel.vehicle = vehicle
        viewModel.trailer = trailer
    }
    
    @IBOutlet weak var switchStatus: UISwitch!
    @IBOutlet weak var lblStaus: UILabel!
    @IBOutlet weak var tfVehicleType: MyTextField!
    var viewModel = EditVehicleVM()
    
    override func viewDidLoad() {
        setupViews()
        viewModel.updateVehicleSuccessfull = updateVehicleSuccessfull
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(tap)


    }
    @objc func handleTapGesture() {
        dismissMe()
    }
    
    func setupViews() {
        //let trailer = RTrailerType.getWith(id: (viewModel.vehicle?.trailerTypeID)!)
        tfVehicleType.text = viewModel.trailer?.name
        for trailertype in (viewModel.vehicle?.trailerType)! {
            if viewModel.vehicle?.trailerTypeID == trailertype.id {
                if trailertype.isActive {
                    lblStaus.text = "Active".text
                    switchStatus.isOn = true
                } else {
                    lblStaus.text = "DeActive".text
                    switchStatus.isOn = false
                }
            }
        }
    }
    


    
    @IBAction func btnCancelPressed(_ sender: Any) {
        dismissMe()
    }
    @IBAction func btnSubmitPressed(_ sender: Any) {
       let id = viewModel.trailer?.id
        var status: Bool? = false
        if switchStatus.isOn {
            status = true
        } else {
            status = false
        }
        showLoading()
        viewModel.requestToUpdateVehicle((viewModel.vehicle?.vehicleCardNo)!, trailerTypeID: id!, isActive: status!, onSuccess: updateVehicleSuccessfull, onFailure: failure)
    }
    func updateVehicleSuccessfull() {
        hideLoading()
        EventsHelper.addressUpdated(vehicle: viewModel.vehicle!)
        dismissMe()
    }
    
}
