//
//  FilterVirtualPermitVM.swift
//  Capp
//
//  Created by tannaz on 1/29/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

class FilterVirtualPermitVM: MyVM {
    
    weak var vc: FilterVirtualPermitVC!
    init(_ vc: FilterVirtualPermitVC) {
        self.vc = vc
    }
    var indexPath: IndexPath?
    var allVPS: [JVPSCargo]? = nil
    var filteredTypeData:[[String]] = [[],[],[] , []]
    var uniqueData: [[String]] = []
    var countsAllItems: [[String:Int]]? = [[:]]
    
    func setupData() {
        for vps in allVPS! {
            filteredTypeData[2].append(vps.cargo)
            filteredTypeData[1].append(vps.weight)
            filteredTypeData[0].append(vps.city)
            filteredTypeData[3].append(String(vps.cargoCost))
        }
        
        for i in (0 ..< filteredTypeData.count) {
            
            let countedSet = NSCountedSet(array: filteredTypeData[i])
            countsAllItems?.append(countedSet.dictionary as! [String : Int])
            
        }
        for unique in filteredTypeData {
            uniqueData.append(unique.uniqueElements)
        }
    }
}

public extension Sequence where Iterator.Element: Hashable {
    var uniqueElements: [Iterator.Element] {
        return Array( Set(self) )
    }
}
public extension Sequence where Iterator.Element: Equatable {
    var uniqueElements: [Iterator.Element] {
        return self.reduce([]){
            uniqueElements, element in
            
            uniqueElements.contains(element)
                ? uniqueElements
                : uniqueElements + [element]
        }
    }
}

extension NSCountedSet {
    var occurences: [(object: Any, count: Int)] {
        return allObjects.map { ($0, count(for: $0))}
    }
    var dictionary: [AnyHashable: Int] {
        return allObjects.reduce(into: [AnyHashable: Int](), {
            guard let key = $1 as? AnyHashable else { return }
            $0[key] = count(for: key)
        })
    }
}



