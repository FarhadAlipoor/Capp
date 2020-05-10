//
//  MyPickerview.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

protocol isAbleToReceiveQuestion {
   func questionSelected(_ question: MySecurityQuestion)
}

class MyPickerview: MyVC {
    
    var delegate : isAbleToReceiveQuestion?
    var pickerDataSource: [String] = []
   @IBOutlet weak var tableView: UITableView!
    var selectQues : MySecurityQuestion?
    func configure(_ items: [String] , delegate: isAbleToReceiveQuestion) {
        pickerDataSource = items
        self.delegate = delegate
        pickerDataSource = ["WhereIsYourAddress?".text , "WhoIsYourBestFriend?".text,"WhatsTheNameOfYourSchool?".text, "WhatsTheNameOfYourCompany?".text,"WhatsYourFavoriteColor?".text ,
                                           "WhatsTheNameOfYourChild?".text]
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {

        if selectQues != nil {
            delegate?.questionSelected(selectQues!)
        }
    }
    @IBAction func btnClosePressed(_ sender: Any) {
        dismissMe()
    }
    
}

extension MyPickerview: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (pickerDataSource.count) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let pickerViewCell = tableView.dequeueReusableCell(withIdentifier: "pickerViewCell", for: indexPath) as! PickerViewCell
        pickerViewCell.lblQuestion.text = pickerDataSource[indexPath.row]
        
        return pickerViewCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                print(pickerDataSource[indexPath.row])
                selectQues = MySecurityQuestion(id: indexPath.row , question: pickerDataSource[indexPath.row])
                dismissMe()
    }
    
    
    

    
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerDataSource.count;
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerDataSource[row] as String
//    }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        print(pickerDataSource[row])
//        selectQues = MySecurityQuestion(id: row + 1, question: pickerDataSource[row])
//        dismissMe()
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        var pickerLabel: UILabel? = (view as? UILabel)
//        if pickerLabel == nil {
//            pickerLabel = UILabel()
//            pickerLabel?.font = Fonts.regular(withSize: 14)
//            pickerLabel?.textAlignment = .center
//        }
//        pickerLabel?.text = pickerDataSource[row]
//        pickerLabel?.textColor = UIColor.darkGray
//
//        return pickerLabel!
//    }

}
