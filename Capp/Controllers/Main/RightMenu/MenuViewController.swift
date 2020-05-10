//
//  MenuViewController.swift
//  AKSwiftSlideMenu
//
//  Created by Ashish on 21/09/15.
//  Copyright (c) 2015 Kode. All rights reserved.
//

import UIKit

protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
    *  Array to display menu options
    */
    @IBOutlet var tblMenuOptions : UITableView!
    
    @IBOutlet weak var imgUser: UIImageView!
    /**
    *  Transparent button to hide menu
    */
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    
    @IBOutlet weak var vwTableMain: UIView!
    /**
    *  Array containing menu options
    */
    var arrayMenuOptions = [Dictionary<String,String>]()
    
    /**
    *  Menu button which was tapped to display the menu
    */
    var btnMenu : UIButton!
    
    /**
    *  Delegate of the MenuVC
    */
    var delegate : SlideMenuDelegate?
    let gradientLayer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblMenuOptions.tableFooterView = UIView()
        let gradientFrame = CGRect(x: self.view.bounds.midX ,y: 0 , width: self.view.bounds.width / 2 , height: self.view.bounds.height)
        view.addGradientBackground(firstColor: CappColors.blue, secondColor: CappColors.green , frame: gradientFrame)
        if let user = StoringData.user {
            lblUsername.text = user.firstName + user.lastName
            let lastPart = "\(user.cardNo),RMTO_BAR,r941123"
            imgUser.downloadedFrom(link: "http://smartcard.rmto.ir:7003/tto/webservice/get_img/" + lastPart)
            imgUser.layer.cornerRadius = imgUser.bounds.height / 2
            imgUser.layer.shadowColor = UIColor.blue.cgColor
            imgUser.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
            imgUser.layer.shadowOpacity = 0.5
            imgUser.layer.shadowRadius = imgUser.bounds.height / 2
            imgUser.layer.masksToBounds = false
        }
 
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions(){
        arrayMenuOptions.append(["title":"MyProfile".text, "icon":"/"])
        arrayMenuOptions.append(["title":"TerminalServices".text, "icon":"m"])
        arrayMenuOptions.append(["title":"Virtual Load Announcement".text, "icon":"~"])
        arrayMenuOptions.append(["title":"VehiclesInformations".text, "icon":"$"])
        arrayMenuOptions.append(["title":"Settings".text, "icon":"z"])
        arrayMenuOptions.append(["title":"Education".text, "icon":"d"])
        arrayMenuOptions.append(["title":"Comments".text, "icon":"w"])
        arrayMenuOptions.append(["title":"InviteFriends".text, "icon":"W"])
        arrayMenuOptions.append(["title":"ContactWithUS".text, "icon":"r"])
        arrayMenuOptions.append(["title":"Exit".text, "icon":"i"])
        
        tblMenuOptions.reloadData()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: +UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                self.view.removeFromSuperview()
                self.removeFromParentViewController()
        })
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellMenu")!
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.layoutMargins = UIEdgeInsets.zero
        cell.preservesSuperviewLayoutMargins = false
        cell.backgroundColor = UIColor.clear
        
        let lblTitle : UILabel = cell.contentView.viewWithTag(101) as! UILabel
        let imgIcon :  UILabel = cell.contentView.viewWithTag(102) as! UILabel
        
        imgIcon.text = arrayMenuOptions[indexPath.row]["icon"]!
        lblTitle.text = arrayMenuOptions[indexPath.row]["title"]!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        self.onCloseMenuClick(btn)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMenuOptions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 47
    }
}
