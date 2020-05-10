//
//  StartSplash.swift
//  Capp
//
//  Created by tannaz on 4/4/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class StartSplash: MyVC {
    
    @IBOutlet weak var progressView: UIProgressView!
    let viewModel = StartSplashVM()
    
    override func viewDidLoad() {
//        if StoringData.loginToken != nil {
//            StoringData.loginToken = ""
//        }
        viewModel.requestToGetAllTerminals(onSuccess: successToGetTerminals, onFailure: failure)
    }
    let sth = StoringData.loginToken
    func successToGetTerminals() {
        progressView.progress = 0.5
        print(sth)
        if Globals.shared.selectedTerminal != nil {
            viewModel.requestToGetTerminalMenuItem(Globals.shared.selectedTerminal.id, onSuccess: successExitSplash, onFailure: failure)
        } else {
            successExitSplash()
        }
    }
    
    func successExitSplash() {
        progressView.progress = 1.0
        if StoringData.loginToken != nil {
            if StoringData.isUserRegisterCapp != nil {
                if StoringData.isUserRegisterCapp! {
                    let vehicleList = Storyboards.main.instantiateViewController(withIdentifier: "vahicleListVC") as! VahicleListVC
                    let navController = MyNav(rootViewController: vehicleList,
                                              patternNavBar: false)
                    present(navController, animated: true, completion: nil)
                } else {
                    performSegue(withIdentifier: "login", sender: self)

                }
            } else {
                performSegue(withIdentifier: "login", sender: self)
            }
        } else {
          performSegue(withIdentifier: "login", sender: self)
        }

    }
}
