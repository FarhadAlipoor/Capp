//
//  PermitDetailsVC.swift
//  Capp
//
//  Created by tannaz on 2/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class PermitDetailsVC: MyVC {
    
    func configure(_ permit:JPermitVPSResponse) {
        viewModel.permit = permit
    }
    
    let viewModel = PermitDetailsVM()
    @IBOutlet weak var lblCargoName: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblPermitNom: UILabel!
    @IBOutlet weak var lblDateAndTime: UILabel!
    @IBOutlet weak var lblTurnsBeforeU: UILabel!
    @IBOutlet weak var lblVisitTerminal: UILabel!
    @IBOutlet weak var lblTimeRemainToInvalidate: UILabel!
    @IBOutlet weak var vwTimeRemain: UIView!
    
    override func viewDidLoad() {
        setupViews()
        
        vwTimeRemain.addGradientBackground(firstColor: CappColors.grayGradientDark, secondColor: CappColors.grayGradientLight)
        
    }
    
    func setupViews() {
        title = "PermitDetails".text
        lblCargoName.text = viewModel.permit?.cargo
        lblCompany.text = viewModel.permit?.company
        lblPermitNom.text = String(describing: viewModel.permit?.permitNo)
        lblDateAndTime.text = viewModel.permit?.dateTime
        
    }
    
    @IBAction func btnReturnToMainMenuPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    @IBAction func btnInvalidPermitPressed(_ sender: Any) {
        showLoading()
        viewModel.invalidPermit(onSuccess: succcessToInvalidPermit, onFailure: failure)
    }
    
    func succcessToInvalidPermit() {
        hideLoading()
    }
    
}
