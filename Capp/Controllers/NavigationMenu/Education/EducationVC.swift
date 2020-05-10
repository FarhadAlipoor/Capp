//
//  EducationVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/24/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class EducationVC: MyVC {
    
    @IBOutlet weak var tableView: UITableView!
    var items = ["EducateToGetVirtualTurn".text,"EducateToChargingSMSServices".text,"EducatoToGetVirtualPermit".text,"EducateToEditVehicle".text,"EducateToSelectCargoype".text]
    override func viewDidLoad() {
        title = "Education".text
    }
}

extension EducationVC: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "educationCell", for: indexPath) as! EducationCell
        cell.configure(items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
