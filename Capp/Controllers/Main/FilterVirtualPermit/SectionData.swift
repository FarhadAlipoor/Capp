//
//  SectionData.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/31/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation

//
// MARK: - Section Data Structure
//
public struct Item {
    var name: String
    var icon: String
    
    public init(name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
}

public struct Section {
    var name: String
    var items: [Item]
    var collapsed: Bool
    
    public init(name: String, items: [Item], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

public var sectionsData: [Section] = []
