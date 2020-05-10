//
//  StoryBoards.swift
//  Capp
//
//  Created by tannaz on 11/19/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import UIKit
struct Storyboards {
    
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    static var auth: UIStoryboard {
        return UIStoryboard(name: "Auth", bundle: Bundle.main)
    }
    static var navigationMenu: UIStoryboard {
        return UIStoryboard(name: "NavigationMenu", bundle: Bundle.main)
    }

}

