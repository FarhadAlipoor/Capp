//
//  CreditReportsVC.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class CreditReportsVC: MyVC {
    
    func config( credit: JCreditReport) {
        creditReport = credit
    }
    var creditReport = JCreditReport()
    var creditMenuItems : [MyMenuItems]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        title = "PaymentReports".text
        creditMenuItems = [MyMenuItems(icon: "]", name: "ParkingCharge".text),
                           MyMenuItems(icon: "4" , name: "ApplicationCharge".text),
                           MyMenuItems(icon: "c" , name: "SMSCharge".text)]
    }
}

extension CreditReportsVC: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditMenuItems!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "creditReportCell", for: indexPath) as! CreditReportCell
        cell.configure(creditMenuItems![indexPath.row] , credit: creditReport , indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
