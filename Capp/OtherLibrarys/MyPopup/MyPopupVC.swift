//
//  MyPopupVC.swift
//  Chilivery
//
//  Created by Sina Khalili on 10/23/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit

class MyPopupVC: UIViewController {
    
    @IBOutlet weak var vwChild: UIView!
    @IBOutlet weak var cnsChildHeight: NSLayoutConstraint!

    // popup space from bottom of screen
    var fromBottom = CGFloat(0)

    var childVC: UIViewController!
    
    // latest visible child view controller as MyVC
    var childTarget: Popupable? {
        get {
            if let c = childVC as? Popupable {
                return c
            } else if let c = (childVC as? UINavigationController)?.viewControllers.last as? Popupable {
                return c
            }
            return nil
        }
    }

    // max and min height of child
    var maxHeight: CGFloat {
        get {
            return childTarget?.maxHeight() ?? 500
        }
    }
    var minHeight: CGFloat {
        get {
            return childTarget?.minHeight() ?? 200
        }
    }

    // respected as much as possible (0 means nothing special, so use a default value)
    var childsPreferredHeight: CGFloat = 0 {
        didSet {
            if childsPreferredHeight <= maxHeight {
                if childsPreferredHeight > 0 {
                    cnsChildHeight.constant = childsPreferredHeight + fromBottom
                } else {
                    cnsChildHeight.constant = childTarget?.childHeight() ?? 300
                }
            } else {
                cnsChildHeight.constant = maxHeight + fromBottom
            }
        }
    }
    static func present(childVC: UIViewController, on parentVC: UIViewController, fromBottom: CGFloat? = 0) {
        let popupVC = MyPopupVC(nibName: "MyPopupVC", bundle: Bundle.main)
        popupVC.childVC = childVC
        popupVC.fromBottom = fromBottom ?? 0
        popupVC.modalTransitionStyle = .crossDissolve
        popupVC.modalPresentationStyle = .overCurrentContext
        parentVC.present(popupVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // present child
        cnsChildHeight.constant = childsPreferredHeight > 0 ? childsPreferredHeight : 300
        addChildViewController(childVC)
        childVC.view.frame = CGRect(x: 0, y: 0, width: vwChild.frame.size.width, height: vwChild.frame.size.height);
        vwChild.addSubview(childVC.view)
        childVC.didMove(toParentViewController: self)
        
        childVC.view.backgroundColor = UIColor.white
        
        if let navigationBar = (childVC as? UINavigationController)?.navigationBar {
            navigationBar.barTintColor = CappColors.gray_lightest
            navigationBar.isTranslucent = false
        }
        
        let tgr = UITapGestureRecognizer(target: self, action: #selector(outsidePressed))
        tgr.cancelsTouchesInView = false
        tgr.delegate = self
        view.addGestureRecognizer(tgr)
        
        //Globals.shared.addPopup(self)
    }
    
    @objc func outsidePressed() {
        if let childTarget = childTarget {
            childTarget.outsideTapped()
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

}

extension MyPopupVC: UIGestureRecognizerDelegate {
    // don't dismiss when touch is inside child view controller
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: childVC.view) ?? false {
            return false
        }
        return true
    }
}

