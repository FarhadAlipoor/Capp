//
//  TerminalPaymentsVC.swift
//  Capp
//
//  Created by tannaz on 2/10/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class TerminalPaymentsVC: MyVC {
    
    let viewModel = TerminalPaymentsVM()
    func configure(_ packages: [JResPackageType]) {
        viewModel.packageTypes = packages
        
    }
    @IBOutlet weak var tableView: UITableView!
    var paymentItem: [MyMenuItems]? = []
    
    override func viewDidLoad() {
        title = "TerminalPayments".text
    }
    
    func successToGetPackagesData() {
        hideLoading()
        let paymentPackageVC = Storyboards.main.instantiateViewController(withIdentifier: "paymentPackageVc") as! PaymentPackageVC
        paymentPackageVC.configure(viewModel.packages ?? [])
        present(paymentPackageVC, animated: false, completion: nil)
    }
        
}

extension TerminalPaymentsVC:UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.packageTypes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "terminalPaymentsCell", for: indexPath) as! TerminalPaymentsCell
        cell.configure(viewModel.packageTypes![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showLoading()
        viewModel.requestToGetPackage(viewModel.packageTypes![indexPath.row].id , onSuccess: successToGetPackagesData, onFailure: failure)
    }
}

