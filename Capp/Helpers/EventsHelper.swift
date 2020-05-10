//
//  EventsHelper.swift
//  Chilivery
//
//  Created by Sina Khalili on 11/5/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import Foundation
import UIKit
/*
 Global events can be occured and observed here!
 */
struct EventsHelper {
    
    static func addressUpdated(vehicle: JVehicle) {
        NotificationCenter.default.post(name: NotificationNames.updateVehicle, object: nil, userInfo: ["vehicle": vehicle])
    }
    //////////
    static func observeVehicleUpdated( _ vc: UIViewController , with callback: Selector) {
        NotificationCenter.default.addObserver(vc, selector: callback, name: NotificationNames.updateVehicle, object: nil)
    }

}
