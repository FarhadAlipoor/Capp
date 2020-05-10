//
//  StoringData.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import Foundation
import CoreLocation

// TODO:: Optimize (caching)

class StoringData {
    
    //    // {S} Login info
    static var fcmToken: String? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "fcmToken")
            }
        }
        get {
            return Pantry.unpack("fcmToken")
        }
    }
    //    // {E}
    //    // {S} Push token
    static var pushToken: String? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "pushToken")
            }
        }
        get {
            return Pantry.unpack("pushToken")
        }
    }
    
    static var loginToken: String! {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "loginToken")
            }
        }
        get {
            return Pantry.unpack("loginToken")
        }
    }
    
    static var driverNo: Int? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "driverNo")
            }
        }
        get {
            return Pantry.unpack("driverNo")
        }
    }
    
    static var nationalCode: String? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "nationalCode")
            }
        }
        get {
            return Pantry.unpack("nationalCode")
        }
    }
    
    static var password: String? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "password")
            }
        }
        get {
            return Pantry.unpack("password")
        }
    }
    
    static var isUserRegisterCapp: Bool? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "isUserRegisterCapp")
            }
        }
        get {
            return Pantry.unpack("isUserRegisterCapp")
        }
    }
    
    static var packages: [JPayPackage]? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "packages")
            } else {
                Pantry.expire("packages")
            }
        }
        get {
            return Pantry.unpack("packages")
        }
    }
    
    static var sequrityQuestion: [String]? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "sequrityQuestion")
            } else {
                Pantry.expire("sequrityQuestion")
            }
        }
        get {
            return Pantry.unpack("sequrityQuestion")
        }
    }
    
    static var terminals: [JTerminalResponse]? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "terminals")
            } else {
                Pantry.expire("terminals")
            }
        }
        get {
            return Pantry.unpack("terminals")
        }
    }
    
    static var user : JResDriver? {
        set {
            if let newValue = newValue {
                Pantry.pack(newValue, key: "user")
            } else {
                Pantry.expire("user")
            }
        }
        get {
            return Pantry.unpack("user")
        }
    }
    
    static func setTrialerType() {
        DispatchQueue.global(qos: .background).async {
            RTrailerType.addAllTrailers()
            
        }
    }
    
    static func emptyToken() {
        Pantry.expire("loginToken")
    }
    
    static func addFavoriteCargos(_ cargo: JVPSCargo) {
        DispatchQueue.global(qos: .background).async {
            RFavoritesCargo.addToFavoriteCargo(cargo)
        }
    }
    
    static func set(_ user: JResDriver?, after: JUserSaveAfter) {
        let loginStatus = after
        switch loginStatus {
        case .logout:
            Pantry.expire("user")
            Pantry.expire("loginToken")
            Pantry.expire("terminals")
            Pantry.expire("nationalCode")
            Pantry.expire("driverNo")
            Pantry.expire("password")
            
            break
        case .login:
            break
        default:
            break
        }
    }
    
    //    // {E}
    //    // {S} Push token sent
    //    static var pushTokenSent: Bool {
    //        set {
    //            Pantry.pack(newValue, key: "pushTokenSent")
    //        }
    //        get {
    //            return Pantry.unpack("pushTokenSent") ?? false
    //        }
    //    }
    //    // {E}
    //
    //    // {S} MyLocation
    //    private static var myLocation: MyLocation? {
    //        set {
    //            if let newValue = newValue {
    //                Pantry.pack(newValue, key: "myLocation")
    //            } else {
    //                Pantry.expire("myLocation")
    //            }
    //        }
    //        get {
    //            return Pantry.unpack("myLocation")
    //        }
    //    }
    //    static func getLocation() -> MyLocation? {
    //        return myLocation
    //    }
    //    static func save(_ myLocation: MyLocation) {
    //        self.myLocation = myLocation
    //    }
    //    // {E}
    //    // {S} Was in restaurants' list last time
    //    static var wasInRestaurantsListLastTime: Bool {
    //        set {
    //            Pantry.pack(newValue, key: "wasInRestaurantsListLastTime")
    //        }
    //        get {
    //            return Pantry.unpack("wasInRestaurantsListLastTime") ?? false
    //        }
    //    }
    //    // {E}
    //
    //
    //    static var introShown: Bool {
    //        set {
    //            Pantry.pack(newValue, key: "introShown")
    //        }
    //        get {
    //            return Pantry.unpack("introShown") ?? false
    //        }
    //    }
    //
    //    // {S} Login User
    ////    static func set(_ user: JUser?, after: JUserSaveAfter) {
    ////        if let newValue = user {
    ////            AnalyticsHelper.logUser(after: after)
    ////
    ////            Pantry.pack(newValue, key: "user")
    ////
    ////            GeneralFunctions.logUser()
    ////
    ////            Intercom.registerUser(withUserId: String(newValue.id))
    ////            let icmUserAttributes = ICMUserAttributes()
    ////            icmUserAttributes.email = newValue.email
    ////            icmUserAttributes.name = newValue.fullName
    ////            icmUserAttributes.phone = newValue.mobileNumber
    ////            Intercom.updateUser(icmUserAttributes)
    ////
    ////        } else {
    ////            Pantry.expire("user")
    ////        }
    ////    }
    
    //    // {E}
    //    // {S} User Addresses
    //    static var userAddresses: [JUserAddress]? {
    //        set {
    //            if let newValue = newValue {
    //                Pantry.pack(newValue, key: "userAddresses")
    //            } else {
    //                Pantry.expire("userAddresses")
    //            }
    //        }
    //        get {
    //            return Pantry.unpack("userAddresses")
    //        }
    //    }
    //    // {E}
    //
    //    // {S} Default addressID of user
    //    static var defaultAddressID: Int? {
    //        set {
    //            if let newValue = newValue {
    //                Pantry.pack(newValue, key: "addressID")
    //            } else {
    //                Pantry.expire("addressID")
    //            }
    //        }
    //        get {
    //            return Pantry.unpack("addressID")
    //        }
    //    }
    //    // {E}
    //
    //    // {S} Default addressID of user
    //    static var buildNumber: Int? {
    //        set {
    //            if let newValue = newValue {
    //                Pantry.pack(newValue, key: "buildNumber")
    //            } else {
    //                Pantry.expire("buildNumber")
    //            }
    //        }
    //        get {
    //            return Pantry.unpack("buildNumber")
    //        }
    //    }
    //    // {E}
    //
    //
    //    // {S} Cache neighbourhoods of cities
    //    static func neighbourhoods(forCityWithID cityID: Int) -> [JRegion]? {
    //        return RRegion.getWith(cityID)
    //    }
    //
    //    static func setNeighbourhoods(_ neighbourhoods: [JRegion]?, forCityWithID cityID: Int) {
    //        DispatchQueue.global(qos: .background).async {
    //            if neighbourhoods != nil {
    //                RRegion.saveWith(neighbourhoods!, cityID: cityID)
    //            } else {
    //                RRegion.removeRegionsOf(cityID)
    //            }
    //        }
    //    }
    //    // {E}
    //
    //    static var launchCount: Int? {
    //        set {
    //            if let newValue = newValue {
    //                Pantry.pack(newValue, key: "launchCount")
    //            } else {
    //                Pantry.expire("launchCount")
    //            }
    //        }
    //        get {
    //            return Pantry.unpack("launchCount")
    //        }
    //    }
    //
}

