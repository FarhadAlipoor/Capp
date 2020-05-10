//
//  DriverLastTurnStatusVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/7/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class DriverLastTurnStatusVC: MyVC {
    
    let viewModel = DriverLastTurnStatusVM()
    
    func configure(_ terminal: JTerminalResponse) {
        viewModel.terminal = terminal
        
    }
    override func viewDidAppear(_ animated: Bool) {
        requestToGetDriverLastTurn()
    }
    @IBOutlet weak var lblTurnNo: UILabel!
    @IBOutlet weak var lblDateAndTime: UILabel!
    @IBOutlet weak var lblTerminalName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblPlateNo: UILabel!
    @IBOutlet weak var lblTrailerType: UILabel!
    @IBOutlet weak var vwNoTurn: UIView!
    @IBOutlet weak var vwMain: UIView!
    @IBOutlet weak var btnGetTurn: MyButton!
    
    override func viewDidLoad() {
        title = "DriverLastTurnStatus".text
    }
    @IBAction func btnGetTurnPressed(_ sender: Any) {
        requestToGetVTSturn()
    }
    
    @IBAction func btnInvalidTurnPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "هشدار", message: "آیا از ابطال نوبت خود مطمين هستید؟", preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "بله", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.invalidTurn()
        }
        let cancelAction = UIAlertAction(title: "خیر", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        present(alertController, animated: true, completion: nil)
    }
    override func failure(_ response: JResponse?) {
        if response?.code == -83 {
            vwNoTurn.isHidden = false
        }
    }
    
    func requestToGetDriverLastTurn() {
        showLoading()
        viewModel.requestToGetTurn(onSuccess: successToGetTurn, onFailure: failure)
        
    }
    
    func requestToGetVTSturn() {
        showLoading()
        viewModel.requestToGetVTSTurn(onSuccess: successToGetVTSTurn, onFailure: failure)
    }
    
    func successToGetVTSTurn() {
        hideLoading()
        let receiveRovekVC = Storyboards.main.instantiateViewController(withIdentifier: "receiveAndRevokeTurnVc") as! ReceiveAndRevokeTurnVC
        receiveRovekVC.configure(viewModel.vtsTurn!)
        navigationController?.pushViewController(receiveRovekVC, animated: true)
    }
    
    func invalidTurn() {
        showLoading()
        viewModel.requestToInvalidTurn(onSuccess: successToInvalidTurn, onFailure: failure)
    }
    
    func successToInvalidTurn() {
        hideLoading()
        vwNoTurn.isHidden = true
    }
    
    func successToGetTurn() {
        hideLoading()
        setupViews()
    }
    
    func setupViews() {
        if (viewModel.driverTurn == nil){
            vwNoTurn.isHidden = false
        } else {
            vwMain.isHidden = false
        lblTurnNo.text = "\(viewModel.driverTurn?.turnNom ?? 0)"
        lblDateAndTime.text = viewModel.driverTurn?.date ?? ""
          print(Globals.shared.terminals)
            for terminal in Globals.shared.terminals {
                    if viewModel.terminal?.id == terminal.id {
                        lblTerminalName.text = terminal.name
                    }
                }
            }
        
            if viewModel.driverTurn?.status == "1" {
                lblStatus.text = "Active".text
            } else {
                lblStatus.text = "DeActive".text
            }
        lblPlateNo.text = "\(viewModel.driverTurn?.plateNom ?? 0)\(viewModel.driverTurn?.plateSerialNo ?? 0)"
        let trailer = RTrailerType.getWith(id: (viewModel.driverTurn?.trailerTypeID)!)
        lblTrailerType.text = trailer?.name
        }
        
    }

