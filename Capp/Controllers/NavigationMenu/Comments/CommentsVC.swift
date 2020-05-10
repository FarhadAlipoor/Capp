//
//  CommentsVC.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/24/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class CommentsVC: MyVC , SelectedFeedBackType {
    

    let viewModel = CommentsVM()
    @IBOutlet weak var btnSendComment: MyButton!
    @IBOutlet weak var tfCommentTitle: MyTextField!
    @IBOutlet weak var tfCommentType: MyTextField!
    @IBOutlet weak var tfComment: MyTextField!
    var typeCode:Int = 0
    func selectedFeedbackTypeIs(_ type: String , typeCode: Int) {
        tfCommentType.text = type
        self.typeCode = typeCode
    }
    override func viewDidLoad() {
        title = "Comments".text
    }
    
    @IBAction func btnSendCommentPressed(_ sender: Any) {
        showLoading()
        viewModel.reqToSendFeedback(tfCommentTitle.text!, feedbackType: typeCode , message: tfComment.text!, onSuccess: successToSendFeedback, onFailure: failure)
    }
    
    func successToSendFeedback() {
        hideLoading()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == tfCommentType {
            let commentTypeVc = Storyboards.main.instantiateViewController(withIdentifier: "selectableItemsVc") as! SelectableItemsVC
            commentTypeVc.configure(mode: .feedback , delegate: self)
            commentTypeVc.modalPresentationStyle = .currentContext
            commentTypeVc.modalTransitionStyle = .coverVertical
            present(commentTypeVc, animated: false, completion: nil)
            return false
        }
        return true
    }
    
}
