//
//  PaymentPackageVC.swift
//  Capp
//
//  Created by tannaz on 2/18/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class PaymentPackageVC: MyVC , SelectedPackage , SSRadioButtonControllerDelegate {
    
    func didSelectButton(selectedButton: UIButton?, index: Int) {
        
    }
    
    
    func selectPackageWith(indexPath: IndexPath) {
        selectedPackage = viewModel.packages?[indexPath.row]
    }
    
    
    func configure(_ payPackage: [JPayPackage]) {
        viewModel.packages = payPackage
        
    }
    var selectedPackage: JPayPackage?
    let viewModel = PaymentPackageVM()
    var radioButtonController: MyRadioButtonController?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        radioButtonController = MyRadioButtonController()
        radioButtonController?.delegate = self;
        radioButtonController?.respectTableView = true;
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTapGesture() {
        dismissMe()
    }
    
    @IBAction func btnCanclePressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnSubmitPressed(_ sender: Any) {
        if selectedPackage != nil {
        let verifyToPaymentVC = Storyboards.main.instantiateViewController(withIdentifier: "verifyToPaymentVc") as! VerifyToPaymentVC
        verifyToPaymentVC.modalTransitionStyle = .coverVertical
        verifyToPaymentVC.modalPresentationStyle = .overCurrentContext
        verifyToPaymentVC.configure(selectedPackage!)
        present(verifyToPaymentVC, animated: true, completion: nil)
        }

    }
}

extension PaymentPackageVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.packages?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentPackageCell", for: indexPath) as! PaymentPackageCell
        cell.configure(viewModel.packages![indexPath.row], selectedDelegate: self, selectedIndexPath: indexPath)
        cell.btnRadio.tag = indexPath.row
        radioButtonController?.addButton(cell.btnRadio)
        cell.btnRadio.isSelected = (radioButtonController?.isSelected(index: indexPath.row)) ?? false
        cell.btnRadio.toggleButon()
        
        return cell
    }
    
    
    
}
