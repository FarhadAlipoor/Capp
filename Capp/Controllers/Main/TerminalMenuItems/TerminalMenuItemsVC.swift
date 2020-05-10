//
//  TerminalMenuItemsVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/2/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class TerminalMenuItemsVC: MyVC {
    let viewModel = TerminalMenuItemsVM()
    
    func configure(_ items: [JTerminalMenu] , terminals: [JTerminalResponse] , selectedTerminal: JTerminalResponse) {
        viewModel.menuItems = items
        viewModel.terminals = terminals
        viewModel.selectedTerminal = selectedTerminal
        Globals.shared.selectedTerminal = selectedTerminal
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        setupTitleView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        hideLoading()
    }
    
    func setupTitleView() {
        
        let button =  UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        button.backgroundColor = UIColor.clear
        let title = viewModel.selectedTerminal?.name.withIcon("5" , size: 16 , iconSize: 14)
        button.setAttributedTitle(title, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.tintColorDidChange()

        button.addTarget(self, action: #selector(self.clickOnButton), for: .touchUpInside)
        self.navigationItem.titleView = button
        addSlideMenuButton()
        
    }
    
    @objc func clickOnButton(button: UIButton) {
        let selectableItemsVC = Storyboards.main.instantiateViewController(withIdentifier: "selectableItemsVc") as! SelectableItemsVC
        selectableItemsVC.configure(mode: .terminals, terminals: viewModel.terminals)
        present(selectableItemsVC, animated: false, completion: nil)
    }
    
    func successToGetPermit() {
        hideLoading()
        let permitDetailsVc = Storyboards.main.instantiateViewController(withIdentifier: "permitDetailsVc") as! PermitDetailsVC
        permitDetailsVc.configure(viewModel.cargoVPS!)
        navigationController?.pushViewController(permitDetailsVc, animated: true)
    }
    
    func successToGetPackageTypes() {
        hideLoading()
       let terminalPaymentsVC = Storyboards.main.instantiateViewController(withIdentifier: "terminalPaymentsVc") as! TerminalPaymentsVC
        terminalPaymentsVC.configure(viewModel.packageTypes!)
        navigationController?.pushViewController(terminalPaymentsVC, animated: true)
    }
    override func failure(_ response: JResponse?) {
        if response?.code == -60 {
            let listOfVistualLicenseVC = Storyboards.main.instantiateViewController(withIdentifier: "listOfVirtualLicenseCargosVc") as! ListOfVirtualLicenseCargosVC
                     navigationController?.pushViewController(listOfVistualLicenseVC, animated: true)
            
        } else {
        }
    }
}

extension TerminalMenuItemsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teminalMenuItemCell", for: indexPath) as! TeminalMenuItemCell
        cell.configure(viewModel.menuItems![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let driverLastTurnStatusVC = Storyboards.main.instantiateViewController(withIdentifier: "driverLastTurnStatusVc") as! DriverLastTurnStatusVC
            driverLastTurnStatusVC.configure(viewModel.selectedTerminal!)
            navigationController?.pushViewController(driverLastTurnStatusVC, animated: true)
        case 1:
            showLoading()
            viewModel.requestToGetPermit(onSuccess: successToGetPermit, onFailure: failure)

        case 2:
            let saloonCargoVC = Storyboards.main.instantiateViewController(withIdentifier: "cargoSaloonVC") as! ShowCargoSaloonVC
             navigationController?.pushViewController(saloonCargoVC, animated: true)
            
        case 3:
            showLoading()
            viewModel.reqToGetPackageType(onSuccess: successToGetPackageTypes, onFailure: failure)
        case 4:
            let terminalReports = Storyboards.main.instantiateViewController(withIdentifier: "terminalReportsVc") as! TerminalReportsVC
            navigationController?.pushViewController(terminalReports, animated: true)
            
        case 5:
            let terminalOnMap = Storyboards.main.instantiateViewController(withIdentifier: "terminalOnMapVc") as! TerminalOnMapVC
            navigationController?.pushViewController(terminalOnMap, animated: true)
        default:
            break
        }
    }
}

