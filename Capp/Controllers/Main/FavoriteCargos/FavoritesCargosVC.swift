//
//  FavoritesCargosVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/27/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class FavoritesCargosVC: MyVC {
    
    @IBOutlet weak var tableView: UITableView!
    let favCargos = try! Realm().objects(RFavoritesCargo.self)
    override func viewDidLoad() {
                tableView.register(UINib(nibName: "CargoDetailsCell", bundle: Bundle.main), forCellReuseIdentifier: "cargoDetailsCell")
        customize()
        title = "FavoriteList".text
    }
    func customize() {
        let btnBack = UIButton(frame:CGRect(x: 0, y: 0, width: 50, height: 50))
        btnBack.setTitle("7", for: .normal)
        btnBack.setTitleColor(UIColor.white, for: .normal)
        btnBack.titleLabel?.font = Fonts.capp(withSize: 25)
        btnBack.addTarget(self, action: #selector(btnBackPressed), for: .touchUpInside)
        let btnbarBack = UIBarButtonItem(customView: btnBack)
        navigationItem.leftBarButtonItem = btnbarBack
        
        
        // pattern navBar background
        
        navigationController?.navigationBar.barTintColor = CappColors.darkBlue
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        
        // fonts
        var font: UIFont!
        font = Fonts.bold(withSize: 16)
        
        navigationController?.navigationBar.titleTextAttributes =
            [
                NSAttributedStringKey.font: font,
                NSAttributedStringKey.foregroundColor: UIColor.white
            ] as [NSAttributedStringKey : Any]
    }
    
    @objc func btnBackPressed() {
        navigationController?.popViewController(animated: true)
        dismissMe()
    }
}
extension FavoritesCargosVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favCargos.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cargoDetailsCell", for: indexPath) as! CargoDetailsCell
                let currentCargo = RFavoritesCargo.convertJVps(favCargos[indexPath.row])
                cell.configure(cargoVPS: currentCargo)
                cell.btnStar.isHidden = false
                return cell
    }
}
