//
//  FilterVirtualPermitVC.swift
//  Capp
//
//  Created by tannaz on 1/29/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class FilterVirtualPermitVC: MyVC , SelectedFilterDelegate , SelectedRangeDelegate {
    var filterRangeArray = [JRange]()
    var byAmount : JRange?
    var byWeight : JRange?
    var filterSelectedCount = 0
    
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel : FilterVirtualPermitVM!
    let kHeaderSectionTag: Int = 6900;
    
    var expandedSectionHeader: UITableViewHeaderFooterView!
    var sectionItems: [[String]] = []
    var sectionNames: Array<MyMenuItems> = []
    var cargosCosts: [Int]? = []
    var cargosWights: [Int]? = []
    var contentOffset: CGPoint? = nil
    var clearAllFilter: Bool = false
    override func viewDidLoad() {
        viewModel.setupData()
        sectionNames = [ MyMenuItems(icon: "k" , name: "CargoDestination".text) ,
                         MyMenuItems(icon: "-" , name: "CargoWeight".text) ,
                         MyMenuItems(icon: "@" , name: "CargoType".text) ,
                         MyMenuItems(icon: "x" , name: "CargoCost".text)
        ];
        sectionItems = [viewModel.uniqueData[0],["d"],viewModel.uniqueData[2],["d"]]
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        cargosCosts = viewModel.filteredTypeData[3].map { Int($0)!}
        cargosCosts?.append(7)
        if let wieghts: [String] = viewModel.filteredTypeData[1] {
            cargosWights = wieghts.map { Int($0) ?? 0}
        }
        cargosWights?.append(12)
    }
    func selectedRangeIs(_ item: JRange) {
        
        switch item.indexPath?.section ?? 1{
        case 1:
            byWeight = item
        case 3:
            byAmount = item
        default:
            break
        }
        
    }
    var filterArray = [JTag]()
    var byDistination = [JTag]()
    var byCargo = [JTag]()
    
    func selectedFilterIs(_ item: JTag) {
        if !item.isSelected {
            for i in (0 ..< filterArray.count) {
                if filterArray[i].title == item.title {
                    filterArray[i] = item
                    filterArray.remove(at: i)
                    break
                }
            }
        } else {
            filterArray.append(item)
            
        }
        for item in filterArray {
            switch item.indexPath?.section ?? 0 {
            case 0:
             byDistination.append(item)

            case 2:
                byCargo.append(item)

            default:
                break
            }
        
        }
    }
    var finalFilters = [JVPSCargo]()

    func filterByCargos(_ cargos: [JTag]) {
        var filtered = [JVPSCargo]()
        var allVps: [JVPSCargo]?
        if finalFilters.count == 0 && !filterArray.isEmpty  {
            allVps = viewModel.allVPS
        }else {
            allVps = finalFilters
        }
            
        for vps in allVps! {
            for cargo in cargos {
                if  vps.cargo == cargo.title {
                    filtered.append(vps)
                    break
                }
            }
        }
        finalFilters = filtered
        
    }
    
    func filterByDistination(_ distinations: [JTag]) {
        var filtered = [JVPSCargo]()
        var allVps: [JVPSCargo]?
        if finalFilters.count == 0 && !filterArray.isEmpty  {
            allVps = viewModel.allVPS
        }else {
            allVps = finalFilters
        }
        
        for vps in allVps! {
            for distination in distinations {
                if  vps.city == distination.title {
                    filtered.append(vps)
                    break
                }
            }
        }
        finalFilters = filtered
    
    }
    
    func filterByWight(_ weight: JRange ) {
        var filtered = [JVPSCargo]()
        var allVps: [JVPSCargo]?
        if finalFilters.count == 0 && !filterArray.isEmpty  {
            allVps = viewModel.allVPS
        }else {
            allVps = finalFilters
        }
        
        for vps in allVps! {
            let minValueInt = Int(weight.minValue)
            let maxValueInt = Int(weight.maxValue)
            let vpsWeightInt = vps.weight.toInt()
            if  vpsWeightInt > minValueInt && vpsWeightInt < maxValueInt {
                filtered.append(vps)
                break
            }
            
        }
        finalFilters = filtered
    }
    
    func filterByAmount(_ amount: JRange ) {
        var filtered = [JVPSCargo]()
        var allVps : [JVPSCargo]?
        if finalFilters.count == 0 && !filterArray.isEmpty {
            allVps = viewModel.allVPS
        } else {
            allVps = finalFilters
        }
        for vps in allVps! {
            let minValueInt = Int(amount.minValue)
            let maxValueInt = Int(amount.maxValue)
            if  vps.cargoCost > minValueInt && vps.cargoCost < maxValueInt {
                filtered.append(vps)
                break
            }
            
        }
        finalFilters = filtered
        
    }
    func btnFilterPressed() {
        if byCargo.count != 0 {
            filterByCargos(byCargo)
        }
        if byDistination.count != 0 {
            filterByDistination(byDistination)
        }
        print(finalFilters)
         performSegue(withIdentifier: "filterUnwind", sender: self)
    }
    
    @IBAction func btnFilterPressed(_ sender: Any) {
        btnFilterPressed()
    }
    @IBAction func btnDeleteAllFiltersPressed(_ sender: Any) {

    }
    
    func cofigure(cargos: [JVPSCargo]) {
        viewModel = FilterVirtualPermitVM(self)
        viewModel.allVPS = cargos
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterUnwind" {
            if let listOfVpsCV =  segue.destination as? ListOfVirtualLicenseCargosVC {
                listOfVpsCV.viewModel.filterVPS = finalFilters
            }
            
        }
    }
}

extension FilterVirtualPermitVC: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let arrayOfItems = self.sectionItems[section] as NSArray
        
        return sectionNames[section].collapsed ? 0 : arrayOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let filterDetailCell = tableView.dequeueReusableCell(withIdentifier: "filterDetailCell", for: indexPath) as! FilterDetailCell
            if clearAllFilter {
                filterDetailCell.isChecked = true
            } else {
                filterDetailCell.isChecked = false
            }
            let title = sectionItems[indexPath.section][indexPath.row]
            if let countData:Int = (viewModel.countsAllItems![indexPath.section+1][title]) {
                
                filterDetailCell.configure(title, count: String(describing: countData), filterDelegate: self, selectedIndexPath: indexPath)
            }
            return filterDetailCell
        case 1:
            let rangeSliderCell = tableView.dequeueReusableCell(withIdentifier: "rangeSliderCell", for: indexPath) as! RangeSliderCell
            rangeSliderCell.configure(cargosWights! , selectedRangeDelegate: self, selectedIndexPath: indexPath )
            return rangeSliderCell
        case 2:
            let filterDetailCell = tableView.dequeueReusableCell(withIdentifier: "filterDetailCell", for: indexPath) as! FilterDetailCell
            filterDetailCell.configure(sectionItems[indexPath.section][indexPath.row], count: "1", filterDelegate: self , selectedIndexPath: indexPath)
            return filterDetailCell
        case 3:
            let rangeSliderCell = tableView.dequeueReusableCell(withIdentifier: "rangeSliderCell", for: indexPath) as! RangeSliderCell
            rangeSliderCell.configure(cargosCosts! , selectedRangeDelegate: self, selectedIndexPath: indexPath )
            return rangeSliderCell
        default:
            return cell
        }
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44.0
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 || indexPath.section == 3 {
            return 82
        } else {
        return sectionNames[indexPath.section].collapsed ? 0 : UITableViewAutomaticDimension
        }
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! SectionHeaderCell
        header.sectionHeaderCell = headerCell
        headerCell.lblIcon.text = sectionNames[section].icon
        headerCell.lblRowTitle.text = sectionNames[section].name
        headerCell.setCollapsed(sectionNames[section].collapsed)
        header.section = section
        header.delegate = self
        header.addSubview(headerCell)
        return header
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let contentOffset = contentOffset {
            tableView.setContentOffset(contentOffset, animated: true)
        }
    }

}

extension FilterVirtualPermitVC: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: SectionHeaderCell, section: Int) {
        let collapsed = !sectionNames[section].collapsed
        
        // Toggle collapse
        sectionNames[section].collapsed = collapsed
        header.setCollapsed(collapsed)
        tableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
    }
    
}
