//
//  TurnReportsVC.swift
//  Capp
//
//  Created by tannaz on 2/11/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class TurnReportsVC: MyVC {
    
    let viewModel = TurnReportsVM()
    
    func configure( _ turnsReports: [JReportTurn]) {
        viewModel.turnsReports = turnsReports
    }
    override func viewDidLoad() {
        title = "TurnsReports".text
    }
    
    @IBOutlet weak var tableView: UITableView!
}
extension TurnReportsVC: UITableViewDataSource , UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.turnsReports!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "turnReportCell", for: indexPath) as! TurnReportCell
        cell.configure(viewModel.turnsReports![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

