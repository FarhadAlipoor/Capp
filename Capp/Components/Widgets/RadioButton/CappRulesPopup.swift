//
//  CappRulesPopup.swift
//  Capp
//
//  Created by tannaz on 12/15/17.
//  Copyright © 2017 Capp. All rights reserved.
//

import Foundation
import UIKit

class CappRulesPopup: MyVC {
    
    @IBOutlet weak var twRules: UITextView!
    override func viewDidLoad() {
        twRules.text = load(file:"قوانین_و_مقررات_استفاده_از_کپ_رانندگان")
        twRules.isEditable = false
    }
    @IBAction func btnClosePressed(_ sender: Any) {
        dismissMe()
    }
    
    func load(file name:String) -> String {
        if let path = Bundle.main.path(forResource: name, ofType: "txt") {
           // let paths = 
            if let contents = try? String(contentsOfFile: path) {
                
                return contents
                
            } else {
                
                print("Error! - This file doesn't contain any text.")
            }
            
        } else {
            
            print("Error! - This file doesn't exist.")
        }
        return ""

}
}
