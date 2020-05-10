//
//  InviteFriendsVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/25/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class InviteFriendsVC: MyVC {
    
    @IBOutlet weak var lblShare: UILabel!
    @IBOutlet weak var vwInviteCode: UIView!
    @IBOutlet weak var lblMessage: UILabel!
    @IBOutlet weak var lblTelegram: MyLabel!
    @IBOutlet weak var lblInviteCod: UILabel!
    let viewModel = InviteFriendsVM()
    
    override func viewDidLoad() {
        title = "InviteFriends".text
        showLoading()
        
        viewModel.requestToGetInviteCode(onSuccess: successToGetInviteCode, onFailure: failure)
                vwInviteCode.addGradientBackground(firstColor: CappColors.grayGradientDark, secondColor: CappColors.grayGradientLight)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        let tapView = UITapGestureRecognizer(target: self, action: #selector(handleTapGestureToShareInviteCode))
        lblShare.addGestureRecognizer(tapView)
        lblMessage.addGestureRecognizer(tapView)
        lblTelegram.addGestureRecognizer(tapView)
        vwInviteCode.addGestureRecognizer(tap)
        }
    
    
    

    @objc func handleTapGesture() {
        UIPasteboard.general.string = viewModel.inviteCode
    }
    
    @objc func handleTapGestureToShareInviteCode(sender: UILabel) {
        let textToShare = viewModel.inviteCode
            let objectsToShare = [textToShare]
        let activityVC = UIActivityViewController(activityItems: objectsToShare ?? [], applicationActivities: nil)
            
            activityVC.popoverPresentationController?.sourceView = sender
        present(activityVC, animated: true, completion: nil)
    }
    
    func successToGetInviteCode() {
        hideLoading()
        lblInviteCod.text = viewModel.inviteCode
    }
}
