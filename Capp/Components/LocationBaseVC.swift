//
//  LocationBaseVC.swift
//  Chilivery
//
//  Created by Sina KH on 11/3/16.
//  Copyright © 2016 Chilivery. All rights reserved.
//

import UIKit
import CoreLocation

class LocationBaseVC: MyVC {

    let locationManager         = CLLocationManager()
    var locationAccessDenied    = false
    var locationAccessGranted   = false {
        didSet {
            if locationAccessGranted &&
                shouldAutoStartUpdatingLocation {
                locationManager.startUpdatingLocation()
            }
        }
    }

    var foundOneTime = false
    var foundLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        if shouldAskUserForLocationAccessOnStart {
            requestLocationUser()
        }
    }
    
    // should ask user for location access granting, on viewDidLoad?
    var shouldAskUserForLocationAccessOnStart   = false
    
    var shouldAutoStartUpdatingLocation         = false
    
    // should stop updating location after founding it, first time?
    var shouldStopLocatingAutomatically         = true
    
    func myNewLocation(is location: CLLocation) {
        // found user's location here!!
        foundLocation = location
    }
    
    func failedToFindLocation() {
        // failed to find user's location
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func requestLocationUser() {
        locationManager.requestWhenInUseAuthorization()
    }

}

// MARK: - CLLocationManagerDelegate
extension LocationBaseVC: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            locationAccessGranted = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            locationAccessDenied = false
            
            //Globals.shared.userLocation = location
            myNewLocation(is: location)
            
            if (!foundOneTime) {
                foundOneTime = true
            }
            
            if (shouldStopLocatingAutomatically) {
                locationManager.stopUpdatingLocation()
            }
        
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationAccessDenied = true
        failedToFindLocation()
    }
    
}
