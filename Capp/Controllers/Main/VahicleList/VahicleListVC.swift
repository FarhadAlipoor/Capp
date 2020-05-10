//
//  VahicleListVC.swift
//  Capp
//
//  Created by tannaz on 12/24/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class VahicleListVC: MyVC , EditSelectedVehicle{
    
    let viewModel = VahicleListVM()
    
    @IBOutlet weak var vwbtnMain: UIView!
    @IBOutlet weak var btnAddNewVehicle: MyButton!
    @IBOutlet weak var vwMainButton: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    var trailersType : [JTrailerType]? = []
    let searchController = UISearchController(searchResultsController: nil)
    var filteredVehicle = [JVehicle]()
    override func viewDidLoad() {
        setupViews()
        EventsHelper.observeVehicleUpdated(self, with: #selector(vehicleUpdated))
        // print(Realm.Configuration.defaultConfiguration.fileURL!)
        
    }
    
    func setupViews() {
        title = "VahiclesList".text
        tableView.isHidden = true
        searchBar.isHidden = true
        vwbtnMain.isHidden = true
        tableView.backgroundColor = CappColors.gray_light
        // create search button
        let btnSearch = UIButton(frame:CGRect(x: -10, y: 0, width: 50, height: 50))
        btnSearch.setTitle(CappIcon.search, for: .normal)
        btnSearch.setTitleColor(UIColor.white, for: .normal)
        btnSearch.titleLabel?.font = Fonts.capp(withSize: 18)
        btnSearch.addTarget(self, action: #selector(btnSearchPressed), for: .touchUpInside)
        let trashBarBtn = UIBarButtonItem(customView: btnSearch)
        navigationItem.leftBarButtonItem = trashBarBtn
        setupVehicles()
        addSlideMenuButton()
        
    }
    
    func editVehicle(indexPath: IndexPath , trailer: RTrailerType) {
        let editVc = Storyboards.main.instantiateViewController(withIdentifier: "editVehicleVc") as! EditVehicleVC
        editVc.configure(viewModel.items![indexPath.row], trailer: trailer)
        editVc.modalTransitionStyle = .crossDissolve
        editVc.modalPresentationStyle = .overCurrentContext
        present(editVc, animated: true, completion: nil)
        
    }
    
    @objc func btnSearchPressed() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search".text
        if #available(iOS 11.0, *) {
            if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    // Background color
                    backgroundview.backgroundColor = UIColor.white
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 10;
                    backgroundview.clipsToBounds = true;
                }
            }
            
            navigationItem.searchController = searchController
            definesPresentationContext = true
        } else {
            navigationItem.hidesBackButton = true
            navigationItem.titleView = searchController.searchBar
            navigationItem.rightBarButtonItem = nil
            searchController.searchBar.becomeFirstResponder()
        }
    }
    
    @objc func btnBurgerPressed() {
        
    }
    
    func setupVehicles() {
        hideLoading()
        tableView.isHidden = false
        vwbtnMain.isHidden = false
        searchBar.isHidden = false
        tableView.reloadData()
        //viewModel.getActiveVehicles(onSuccess: successToGetAllData ,onFailure: failure)
        
    }
    
    @objc func vehicleUpdated(notification: NSNotification) {
        if let updatedAddress = notification.userInfo?["vehicle"] as? JVehicle {
            for i in 0 ..< (viewModel.items?.count ?? 0) {
                if viewModel.items![i].plateNo == updatedAddress.plateNo {
                    viewModel.items![i] = updatedAddress
                    self.tableView.reloadData()
                    return
                }
            }
        }
        
    }
    @IBAction func btnAddNewVehiclePressed(_ sender: Any) {
        
        //        let newVehicleVc = Storyboards.main.instantiateViewController(withIdentifier: "chooseServiceTypeVc") as! ChooseServiceTypeVC
        //        navigationController?.pushViewController(newVehicleVc, animated: true)
        let newVehicleVc = Storyboards.main.instantiateViewController(withIdentifier: "newVehicleVc") as! NewVehicleVC
        navigationController?.pushViewController(newVehicleVc, animated: true)
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredVehicle = viewModel.items!.filter({( vehicle : JVehicle) -> Bool in
            let plateNo = "\(vehicle.plateNo)"
            return plateNo.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
}

extension VahicleListVC: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredVehicle.count
        }
        return (viewModel.items?.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vehicleListCell = tableView.dequeueReusableCell(withIdentifier: "vahicleListCell", for: indexPath) as! VahicleListCell
        if isFiltering() {
            vehicleListCell.configure(filteredVehicle[indexPath.row], editDelegate: self, selectedIndex: indexPath)
        } else {
            vehicleListCell.configure(viewModel.items![indexPath.row] , editDelegate: self , selectedIndex: indexPath)
        }
        return vehicleListCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 196
    }
    
}
extension VahicleListVC: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
}

