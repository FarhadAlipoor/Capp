//
//  ListOfVirtualLicenseCargosVC .swift
//  Capp
//
//  Created by Tannaz Parsa on 1/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class ListOfVirtualLicenseCargosVC: MyVC {
    
    let viewModel = ListOfVirtualLicenseCargosVM()
    var selectedCargo: JVPSCargo? = nil
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var vwNoCargo: UIView!
    var isFilterMode: Bool = false
    
    override func viewDidLoad() {
        reqToGetVirtualVPS()
        title = "ListCargoOfVirtualPermit".text
        tableview.separatorStyle = .none
        title = "ListOfVirtualLicenseCargo".text
        navigationItem.leftItemsSupplementBackButton = true
        let secondButton = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(self.filterBtnPressed))
        if let font = UIFont(name: "CAPP", size: 18) {
            secondButton.setTitleTextAttributes([NSAttributedStringKey.font:font], for: .normal)
        }
        navigationItem.leftBarButtonItem = secondButton
        tableview.register(UINib(nibName: "CargoDetailsCell", bundle: Bundle.main), forCellReuseIdentifier: "cargoDetailsCell")

    }
    
    @objc func filterBtnPressed() {
        if let cargosVPS = viewModel.cargoVPs {
        let filterVirtualVC = Storyboards.main.instantiateViewController(withIdentifier: "filterVirtualPermitVc") as! FilterVirtualPermitVC
        filterVirtualVC.cofigure(cargos: cargosVPS)
        navigationController?.pushViewController(filterVirtualVC, animated: true)
        }
    }
    
    func reqToGetVirtualVPS() {
        showLoading()
        viewModel.requestToGetCargoPermit(onSuccess: successToGetCargoPermit, onFailure: failure)
        
    }
    
    override func failure(_ response: JResponse?) {
        hideLoading()
    }
    
    func successToGetCargoPermit() {
        hideLoading()
        tableview.reloadData()
        if viewModel.cargoVPs?.count == 0 || viewModel.cargoVPs == nil {
            vwNoCargo.isHidden = false
        }
        for cargo in viewModel.cargoVPs! {
            viewModel.distinations.append(cargo.distination)
            viewModel.cargoWeights.append(cargo.weight)
            viewModel.cargosCosts.append(cargo.cargoCost)
            viewModel.cargosType.append(cargo.cargo)
        }
    }
    
    func showCargoDetails() {
        let cargoDetailcVc = Storyboards.main.instantiateViewController(withIdentifier: "cargoDetailsVc") as! CargosDetailsVC
        cargoDetailcVc.configure(cargo: selectedCargo! , mode: .permit)
        cargoDetailcVc.modalTransitionStyle = .coverVertical
        cargoDetailcVc.modalPresentationStyle = .overCurrentContext
        present(cargoDetailcVc, animated: true, completion: nil)
    }
    
    @IBAction func unwindToListOfCargosVC(segue:UIStoryboardSegue) {
        isFilterMode = true
        tableview.reloadData()
    }
    
}

extension ListOfVirtualLicenseCargosVC: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFilterMode {
            return viewModel.filterVPS?.count ?? 0
        } else {
        return viewModel.cargoVPs?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cargoDetailsCell", for: indexPath) as! CargoDetailsCell
        if isFilterMode {
          cell.configure(cargoVPS: viewModel.filterVPS![indexPath.row])

        } else {
           cell.configure(cargoVPS: viewModel.cargoVPs![indexPath.row])
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFilterMode {
            selectedCargo = viewModel.filterVPS?[indexPath.row]
        } else {
           selectedCargo = viewModel.cargoVPs?[indexPath.row]
        }
        
        showCargoDetails()
    }
    
    
}
