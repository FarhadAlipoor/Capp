//
//  PaymentsReportsVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 3/3/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class PaymentsReportsVC: MyVC {
    
    let viewModel = PaymentsReportsVM()
    func configire(_ paymentReports: [JReportPayment]) {
        viewModel.allPaymentReports = paymentReports
        
    }
    override func viewDidLoad() {
        title = "PaymentsReports".text
    }
    
    @IBOutlet weak var tableView: UITableView!
}

extension PaymentsReportsVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allPaymentReports!.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reportPaymentCell", for: indexPath) as! ReportPaymentCell
        cell.configure(viewModel.allPaymentReports![indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
