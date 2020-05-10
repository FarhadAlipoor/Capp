//
//  MyNavigationController.swift
//  Chilivery
//
//  Created by Sina Khalili on 10/23/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit
import KDInteractiveNavigationController

// TODO:: Optimize and move customizations into viewDidLoad instead of viewWillAppear (bold title not working if we do it now!)
class MyNav: KDInteractiveNavigationController {

    // pattern nav bar indicates that is background an image or not
    var patternNavBar   = true
    var boldTitle       = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.semanticContentAttribute = .forceRightToLeft
        clearBackTitle = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customize()
    }
    
    func customize() {
        
        // pattern navBar background
        navigationBar.barTintColor = CappColors.darkBlue
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false

        
        // fonts
        var font: UIFont!
        if boldTitle {
            font = Fonts.bold(withSize: 16)
        } else {
            font = Fonts.font(withSize: 16)
        }
        
        navigationBar.titleTextAttributes =
            [
                NSAttributedStringKey.font: font,
                NSAttributedStringKey.foregroundColor: UIColor.white
            ] as [NSAttributedStringKey : Any]
    }
    
    init(rootViewController: UIViewController,
         patternNavBar: Bool,
         dismissButton: Bool = false,
         boldTitle: Bool = false) {
        super.init(rootViewController: rootViewController)
        self.boldTitle = boldTitle
        self.patternNavBar = patternNavBar
        if dismissButton {
          //  (visibleViewController as? MyVC)?.addDismissButton()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}
