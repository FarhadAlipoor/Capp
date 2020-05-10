//
//  SliderTest.swift
//  Capp
//
//  Created by Tannaz Parsa on 1/9/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
import UIKit

class SliderTest: MyVC {
    
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        let img = UIImage(named: "Slider")
        let img2 = UIImage(named: "SliderSelected")
        slider.setMaximumTrackImage(img, for: .normal)
        slider.setMinimumTrackImage(img2, for: .normal)
    }
}
