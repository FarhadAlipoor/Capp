//
//  TerminalReportsVC.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class TerminalReportsVC : MyVC {
    
    @IBOutlet weak var tableView: UITableView!
    var reportItems: [MyMenuItems] = []
    let viewModel = TerminalReportsVM()
    override func viewDidLoad() {
        title = "Reports".text
        reportItems = [MyMenuItems(icon: ".", name: "TurnsReports".text),
                       MyMenuItems(icon: "`", name: "PermitReports".text) ,
                       MyMenuItems(icon: "n", name: "CreditReports".text),
                       MyMenuItems(icon: "x", name: "PaymentsReports".text)]
        
        tableView.register(UINib(nibName: "MenuItemCell", bundle: Bundle.main), forCellReuseIdentifier: "menuItemCell")
        
    }
    
    func successToGetTurnsReports() {
        hideLoading()
        let turnsReportsVc = Storyboards.main.instantiateViewController(withIdentifier: "turnReportsVC") as! TurnReportsVC
        turnsReportsVc.configure(viewModel.turnsReports ?? [])
        navigationController?.pushViewController(turnsReportsVc, animated: true)
    }
    
    func successToGetPermitReports() {
        hideLoading()
       let permitReportVc = Storyboards.main.instantiateViewController(withIdentifier: "permitReportsVC") as! PermitReportsVC
        permitReportVc.configure(viewModel.permitReports ?? [])
        navigationController?.pushViewController(permitReportVc, animated: true)
    }
    
    func successToGetCreditReports() {
        hideLoading()
       let creditReportVc = Storyboards.main.instantiateViewController(withIdentifier: "creditReportsVC") as! CreditReportsVC
        creditReportVc.config(credit: viewModel.creditReports ?? JCreditReport())
        navigationController?.pushViewController(creditReportVc, animated: true)
    }
    
    func successToGetPaymentsReports() {
        hideLoading()
        let paymentsReportsVc = Storyboards.main.instantiateViewController(withIdentifier: "paymentsReportsVc") as! PaymentsReportsVC
        paymentsReportsVc.configire(viewModel.paymentReports!)
        navigationController?.pushViewController(paymentsReportsVc, animated: true)
    }
}

extension TerminalReportsVC: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell", for: indexPath) as! MenuItemCell
        cell.configure(reportItems[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showLoading()
        switch indexPath.row {
        case 0:
            viewModel.requestToGetDriverTurnsReports(successToGetTurnsReports, onFailure: failure)
        case 1:
            viewModel.requestToGetDriverPermitReports(successToGetPermitReports, onFailure: failure)
        case 2:
            viewModel.requestToGetDriverCreditReports(successToGetCreditReports, onFailure: failure)
        case 3:
            viewModel.requestToGetPaymentsReports(successToGetPaymentsReports, onFailure: failure)
        default:
            break
        }
        
    }
    
}

