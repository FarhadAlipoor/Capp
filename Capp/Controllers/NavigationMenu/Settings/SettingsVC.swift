//
//  SettingsVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/24/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class SettingsVC: MyVC {
    
    @IBOutlet weak var tableView: UITableView!
    var items : [MyMenuItems] = [MyMenuItems(icon: "q", name: "CommunicationSettings".text) ,
                                 MyMenuItems(icon: "j", name: "ProfileSetting".text)]
    
    override func viewDidLoad() {
        title = "Settings".text
    }
}

extension SettingsVC: UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! SettingsCell
        cell.configure(items[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let communicationSettingsVc = Storyboards.navigationMenu.instantiateViewController(withIdentifier: "communicationSettingsVc") as! CommunicationSettingsVC
            communicationSettingsVc.modalTransitionStyle = .coverVertical
            communicationSettingsVc.modalPresentationStyle = .overCurrentContext
            present(communicationSettingsVc, animated: false, completion: nil)
        case 1:
            let profileVc = Storyboards.main.instantiateViewController(withIdentifier: "myProfileVC") as! MyProfileVC
            navigationController?.pushViewController(profileVc, animated: true)
        default:
            break
        }
    }
}
