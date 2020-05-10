////
////  ViewController.swift
////  Chilivery
////
////  Created by Sina Khalili on 9/25/17.
////  Copyright © 2017 IMBCo. All rights reserved.
////
//
import UIKit
import ReachabilitySwift
import IQKeyboardManager
//
class MyVC: UIViewController, UITextFieldDelegate , SlideMenuDelegate {

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    var leftItem = ""
    var alert = MyAlertView()
    var MenuviewModel = MenuVM()
    var keyboardHeight: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: NSNotification.Name.UIKeyboardWillShow,
            object: nil
        )

        definesPresentationContext = true

        customizations()

        if forceInternetConnection() {
            if (Reachability.init()!.connection == .none) {
                // TODO::
            }
        }

       // WebViewHelper.openAlexaWebView(in: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if !leftItem.isEmpty {
            makeLeftItemButton(leftItem)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        leftBtn.removeFromSuperview()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // TODO:: handleDeepLink()
      //  Intercom.setLauncherVisible(isIntercomAvailable())
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
//        if let vc = UIWindow.visibleViewController as? MyVC {
//            Intercom.setLauncherVisible(vc.isIntercomAvailable())
//        }
    }
    
    var myLoadingView: MyLoadingView? = nil
    var mainView: UIView? = nil
    func showLoading() {
        if myLoadingView == nil {
             mainView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            mainView?.backgroundColor = UIColor.clear
            myLoadingView = MyLoadingView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
            myLoadingView?.center = view.center
            view.addSubview(mainView!)
            mainView?.addSubview(myLoadingView!)
        }
        myLoadingView?.show()
    }
    
    func hideLoading() {
        myLoadingView?.hide()
        mainView?.isHidden = true
    }

    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.keyboardHeight = keyboardHeight
        }
    }

    override func willMove(toParentViewController parent: UIViewController?) {
        customizations()
    }

    func customizations() {
        GeneralFunctions.customize(navigationItem)
        if isNavigationBarClear() {
            makeNavigationBarClear()
        }
    }
    func makeNavigationBarClear() {
        self.interactiveNavigationBarHidden = true
    }

    // makes title of the view controller, clickable with an arrow next to it.
    var leftBtn = UIButton()
    func makeLeftItemButton(_ leftItem: String) {
        self.leftItem = leftItem
        leftBtn.removeFromSuperview()
        leftBtn = UIButton(frame: CGRect(x: 4, y: 5, width: 100, height: 40))
        let str: String = "\(CappIcon.back) \(leftItem)"
        let attr: NSMutableAttributedString = NSMutableAttributedString(string: str, attributes: [
            NSAttributedStringKey.font: Fonts.font(withSize: 15),
            NSAttributedStringKey.foregroundColor: UIColor.white
            ])
        attr.addAttributes([
            NSAttributedStringKey.font: Fonts.capp(withSize: 15),
            NSAttributedStringKey.baselineOffset: -3
            ], range: NSRange.init(location: 0, length: 1))
        leftBtn.setAttributedTitle(attr, for: .normal)
        leftBtn.sizeToFit()
        if leftBtn.frame.width > UIScreen.main.bounds.width - 80 { // check if it goes on right buttons
            leftBtn.frame.size.width = UIScreen.main.bounds.width - 80 // handle it!
        }
        leftBtn.addTarget(self, action: #selector(titleTaped), for: .touchUpInside)
        //        navigationItem.titleView = btn
        navigationController?.navigationBar.addSubview(leftBtn)
    }

    @objc func titleTaped() { }

    // isNavigationBarClear or it's red ? , Chilivery will handle it magically :)
    func isNavigationBarClear() -> Bool {
        return false
    }

    // next text field!
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if(textField.tag>0) {
            if let nextView: UIView = view.viewWithTag(textField.tag+1) {
                nextView.becomeFirstResponder()
            } else {
                submit()
            }
        }
        return false
    }

    // add logo to navigation bar
    func addTitleLogo() {
        let imageView = UIImageView(image: UIImage(named: "Logo"))
        imageView.contentMode = .scaleAspectFit

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        imageView.frame = titleView.bounds;
        titleView.addSubview(imageView)

        self.navigationItem.titleView = titleView
    }

    func setLeftNavItem(txt: String, isChiliIcon: Bool = false, size: CGFloat = 15) {
        navigationItem.leftBarButtonItem?.title = txt
     //   let attributes = [NSAttributedStringKey.font: isChiliIcon ? Fonts.chili(withSize: size) : Fonts.font(withSize: size),
         //                 NSAttributedStringKey.foregroundColor: UIColor.white]
       // navigationItem.leftBarButtonItem?.setTitleTextAttributes(attributes, for: .normal)
    }
    func setRightNavItem(txt: String, isChiliIcon: Bool = false, size: CGFloat = 15, offset: Int = 0) {
        navigationItem.rightBarButtonItem?.title = txt
      //  let attributes = [NSAttributedStringKey.font: isChiliIcon ? Fonts.chili(withSize: size) : Fonts.font(withSize: size),
       // NSAttributedStringKey.foregroundColor;: UIColor.white]
       // navigationItem.rightBarButtonItem?.setTitleTextAttributes(attributes, for: .normal)
    }
    func addDismissButton(color: UIColor = CappColors.gray_light) {
        let v = MyButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        v.setAttributedTitle(NSAttributedString(string: CappIcon.back, attributes: [
            NSAttributedStringKey.font: Fonts.capp(withSize: 17),
            NSAttributedStringKey.foregroundColor: color
            ]), for: .normal)
        v.addTarget(self, action: #selector(dismissMe), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: v)
    }
    @objc func dismissMe() {
        dismiss(animated: false, completion: nil)
    }

    // submit on keyboard return key
    func submit() { }

    // progress bar

    func showProgress() {
    }

    func hideProgress() {
    }
    // refresh

    var isRefreshing    = false
    var isLoadingMore   = false
    var loadedAll       = false
    var refreshControl  = UIRefreshControl()
    func initRefreshControl(_ tableView: UITableView, color: UIColor? = nil) {
        if color != nil {
            refreshControl.tintColor = color
        }
        refreshControl.removeTarget(self, action: #selector(refresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: UIControlEvents.valueChanged)
        refreshControl.removeFromSuperview()
        tableView.addSubview(refreshControl)
    }

    @objc func refresh(_ sender:AnyObject) {
        isRefreshing = true
    }

    func endRefreshing() {
        if self.isRefreshing {
            self.isRefreshing = false
        }
        self.refreshControl.endRefreshing()
    }
    func endLoadingMore() {
        isLoadingMore = false
    }

    // is internet connection forced?? ( if yes, show connection error view, if needed )
    func forceInternetConnection() -> Bool {
        return false
    }

    // is intercom available in this viewController ?
    func isIntercomAvailable() -> Bool {
        return false
    }
    func addingBlurToBackgroundView() {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(blurEffectView)
        view.sendSubview(toBack: blurEffectView)

    }
    
    func successToGetPackagePayment() {
        let registerInvoiceC = Storyboards.auth.instantiateViewController(withIdentifier: "registerInvoiceVC") as! RegisterInvoiceVC
        //JPayPackage
        registerInvoiceC.configure(MenuviewModel.packages ?? [])
        registerInvoiceC.modalTransitionStyle = .coverVertical
        registerInvoiceC.modalPresentationStyle = .overCurrentContext
        present(registerInvoiceC, animated: false, completion: nil)
        

    }

    /////////// AlertView
    func failure(_ response: JResponse?) {
        actShowSnackbar((response?.message!)! , actionTitle: "Close".text)

        if let code = response?.code {
        switch code {
        case -4:
            StoringData.isUserRegisterCapp = false
            MenuviewModel.requestToGetPackage(successToGetPackagePayment , onFailure: failure)
        case -85:
            StoringData.isUserRegisterCapp = false
            MenuviewModel.requestToGetPackage(successToGetPackagePayment , onFailure: failure)
        case -61:
            let loginVc = Storyboards.auth.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
            navigationController?.pushViewController(loginVc, animated: true)
        case -3:
            let loginVc = Storyboards.auth.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
            navigationController?.pushViewController(loginVc, animated: true)
        case -23:
                let newVehicleVc = Storyboards.main.instantiateViewController(withIdentifier: "newVehicleVc") as! NewVehicleVC
                newVehicleVc.haveVehicle = false
                let navController = MyNav(rootViewController: newVehicleVc,
                                          patternNavBar: false)
                present(navController, animated: true, completion: nil)
        case -60:
            actShowSnackbar("راننده مجوز معتبر ندارد " , actionTitle: "Close".text)
        default:
            break
            
           }
        }
        hideLoading()
        endRefreshing()
    }
    
    func actShowSnackbar(_ message: String , actionTitle: String) {
        
        let snackbar = MySnackbar(message: message,
                                   duration: .middle,
                                   actionText: actionTitle,
                                   actionBlock: { (snackbar) in
                                   snackbar.dismiss()
        })
        IQKeyboardManager.shared().resignFirstResponder()
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true        
        snackbar.show()
        
    }
    
    let chooseServiceTypeVM = ChooseServiceTypeVM()
    func slideMenuItemSelectedAtIndex(_ index: Int32) {
        let topViewController : UIViewController = self.navigationController!.topViewController!
        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            print("Home\n", terminator: "")
            self.openViewControllerBasedOnIdentifier("myProfileVC")
          //  self.openViewControllerBasedOnIdentifier("Home")
            
            break
        case 1:
            print("Play\n", terminator: "")
            chooseServiceTypeVM.requestToGetAllTerminals(onSuccess: successToGetAllTerminals, onFailure: failure)
           // self.openViewControllerBasedOnIdentifier("PlayVC")
            
            break
        case 2:
            break
        case 3:
            break
        case 4:
            let settingsVC = Storyboards.navigationMenu.instantiateViewController(withIdentifier: "settingsVc") as! SettingsVC
            navigationController?.pushViewController(settingsVC, animated: true)
            break
        case 5:
            let educationVC = Storyboards.navigationMenu.instantiateViewController(withIdentifier: "educationVc") as! EducationVC
            navigationController?.pushViewController(educationVC, animated: true)
            break
        case 6:
            let commentVc = Storyboards.navigationMenu.instantiateViewController(withIdentifier: "commentsVc") as! CommentsVC
            navigationController?.pushViewController(commentVc, animated: true)
            break
        case 7:
            let inviteFriendsVC = Storyboards.navigationMenu.instantiateViewController(withIdentifier: "inviteFriendsVc") as! InviteFriendsVC
            navigationController?.pushViewController(inviteFriendsVC, animated: true)
            break
        case 8:
            let contactUSVc = Storyboards.navigationMenu.instantiateViewController(withIdentifier: "contactUSVc") as! ContactUSVC
            navigationController?.pushViewController(contactUSVc, animated: true)
            break
        case 9:
            let alertController = UIAlertController(title: "خروج", message: "آیا می خواهید خارج شوید؟", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "بله", style: UIAlertActionStyle.default) {
                UIAlertAction in
                self.MenuviewModel.requestToLogoutUser(onSuccess: self.successToLogout, onFailure: self.failure)
            }
            let cancelAction = UIAlertAction(title: "خیر", style: UIAlertActionStyle.cancel) {
                UIAlertAction in
                NSLog("Cancel Pressed")
            }
            
            // Add the actions
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            // Present the controller
            present(alertController, animated: true, completion: nil)
        
        default:
            print("default\n", terminator: "")
        }
    }
    func successToLogout() {
        StoringData.set(StoringData.user, after: .logout)
        let loginVc = Storyboards.auth.instantiateViewController(withIdentifier: "loginVC") as! LoginVC
        navigationController?.pushViewController(loginVc , animated: true)
    }
    
    func successToGetAllTerminals() {
        let selectableItemsVC = Storyboards.main.instantiateViewController(withIdentifier: "selectableItemsVc") as! SelectableItemsVC
        selectableItemsVC.configure(mode: .terminals, terminals: chooseServiceTypeVM.terminals)
        present(selectableItemsVC, animated: false, completion: nil)

    }
    
    func openViewControllerBasedOnIdentifier(_ strIdentifier:String){
        let destViewController : UIViewController = Storyboards.main.instantiateViewController(withIdentifier: strIdentifier)
        
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
//        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
//            print("Same VC")
//        } else {
            self.navigationController!.pushViewController(destViewController, animated: true)
      //  }
    }
    
    func addSlideMenuButton(){
        // create burger menu
        let btnBurger = UIButton(frame:CGRect(x: 10, y: 10, width: 50, height: 50))
        btnBurger.setTitle(CappIcon.burgerMenu, for: .normal)
        btnBurger.setTitleColor(UIColor.white, for: .normal)
        btnBurger.titleLabel?.font = Fonts.capp(withSize: 18)
        btnBurger.addTarget(self, action: #selector(onSlideMenuButtonPressed), for: .touchUpInside)
        let burgerBarBtn = UIBarButtonItem(customView: btnBurger)
        navigationItem.rightBarButtonItem = burgerBarBtn
    }
    
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = 1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        UIApplication.shared.keyWindow?.addSubview(menuVC.view)
        self.addChildViewController(menuVC)
        
        menuVC.view.layoutIfNeeded()
        menuVC.view.frame=CGRect(x: 0 + UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
}

enum MyAlertType {
    case warning
    case progress
    case success
    case error
}



