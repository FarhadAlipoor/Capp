//
//  ShowCargoSaloonVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/22/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
class ShowCargoSaloonVC: MyVC {
    
    let viewModel = ShowCargoSaloonVM()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblSaloonName: UILabel!
    @IBOutlet weak var lblCargoSaloonValidation: UILabel!
    @IBOutlet weak var lblStartTime: UILabel!
    @IBOutlet weak var lblCargoQuantity: UILabel!
    let favCargos = try! Realm().objects(RFavoritesCargo.self)

    override func viewDidLoad() {
        title = "ShowCargoSaloon".text
        requestToGetCargoSaloon()
        tableView.register(UINib(nibName: "CargoDetailsCell", bundle: Bundle.main), forCellReuseIdentifier: "cargoDetailsCell")
    }
    
    func requestToGetCargoSaloon() {
        showLoading()
        viewModel.getSaloonCargo(onSuccess: getCargoSaloonSuccessfull, onFailure: failure)
    }
    
    func getCargoSaloonSuccessfull() {
        setupViews()
    }
    
    func setupViews() {
        hideLoading()
        if let saloonCargo = viewModel.saloonCargo {
        lblSaloonName.text = saloonCargo.saloonName
        lblCargoSaloonValidation.text = String(describing: saloonCargo.balance)
        lblStartTime.text = saloonCargo.startDate
        lblCargoQuantity.text = String(describing: saloonCargo.count)
        tableView.reloadData()
        }
    }
    
    func showCargoDetails(_ selectedCargo: JVPSCargo) {
        let cargoDetailcVc = Storyboards.main.instantiateViewController(withIdentifier: "cargoDetailsVc") as! CargosDetailsVC
        cargoDetailcVc.configure(cargo: selectedCargo , mode: .saloon)
        cargoDetailcVc.modalTransitionStyle = .coverVertical
        cargoDetailcVc.modalPresentationStyle = .overCurrentContext
        present(cargoDetailcVc, animated: true, completion: nil)
    }
}

extension ShowCargoSaloonVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cargos?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cargoDetailsCell", for: indexPath) as! CargoDetailsCell
        cell.configure(cargoVPS: viewModel.cargos![indexPath.row])
        cell.btnStar.isHidden = false
        for favCargo in favCargos {
            if favCargo.masterID == viewModel.cargos![indexPath.row].masterID {
                cell.btnStar.setTitle("p", for: .normal)
                cell.isFavorite = true
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showCargoDetails(viewModel.cargos![indexPath.row])
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
