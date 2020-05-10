//
//  PermitReportsVC.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class PermitReportsVC: MyVC {
    
    let viewModel = PermitReportsVM()
    
    func configure(_ permits: [JPermitVPSResponse]) {
        viewModel.permits = permits
    }
    override func viewDidLoad() {
        title = "PermitReports".text
    }
    
    @IBOutlet weak var tableView: UITableView!
}
extension PermitReportsVC: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.permits!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "permitReportCell", for: indexPath) as! PermitReportCell
        cell.configure(viewModel.permits![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
