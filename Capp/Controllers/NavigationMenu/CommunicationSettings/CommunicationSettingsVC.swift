//
//  CommunicationSettingsVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/24/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class CommunicationSettingsVC: MyVC , SelectedCommunication {
    
    @IBOutlet weak var vwOutSide: UIView!
    @IBOutlet weak var tableView: UITableView!
    var menuItems: [String] = ["SMSServices".text , "Internet".text , "Offline" ]
    var selectedCommunication: String? = ""
    
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        vwOutSide.addGestureRecognizer(tap)
    }
    
    @objc func handleTapGesture() {
        dismissMe()
    }
    
    
    func selectedCommunicationIs(_ indexPath: IndexPath) {
        selectedCommunication = menuItems[indexPath.row]
    }
    @IBAction func btnCancelPressed(_ sender: Any) {
        dismissMe()
    }
    @IBAction func btnSubmitPressed(_ sender: Any) {
        dismissMe()
    }
    
}
extension CommunicationSettingsVC: UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "communicationSettingsCell", for: indexPath) as! CommunicationSettingsCell
        cell.configure(menuItems[indexPath.row] , delegate: self , selectedIndexPath: indexPath)
        return cell
        
    }
}
