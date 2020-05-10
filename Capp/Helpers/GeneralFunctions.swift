//
//  GeneralFunctions.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import UIKit
import SVProgressHUD
//import Fabric
import ReachabilitySwift

class GeneralFunctions {
    
    static func customize(_ navigationItem: UINavigationItem? = nil) {
        // Customizing bar button items' fonts
        let attributes = [NSAttributedStringKey.font: Fonts.font(withSize: 15),
                          NSAttributedStringKey.foregroundColor: UIColor.white,
                          NSAttributedStringKey.baselineOffset: -3] as [NSAttributedStringKey : Any]
        navigationItem?.rightBarButtonItem?.setTitleTextAttributes(attributes, for: .normal)
        navigationItem?.leftBarButtonItem?.setTitleTextAttributes(attributes, for: .normal)
    }
    
    static func delay(`for` seconds: Float, codes: @escaping () -> ()) {
        let deadlineTime = DispatchTime.now() + .milliseconds(Int(seconds * 1000))
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: codes)
    }
    
    static func logout() {
      //  StoringData.set(nil, after: .logout)
        
        // TODO:: Globals.shared.restaurantDetails = nil
        
        
       // logUser()
        
        // SEGAnalytics.shared().reset()
        
        // TODO:: NotificationCenter.default.post(name: NotificationNames.basketModified, object: nil)
        // NotificationCenter.default.post(name: NotificationNames.logoutSuccessful, object: nil)
    }
    
//    static func logUser() {
//        if let user = StoringData.user {
//            // Appsee.setUserID(user.email)
//
//            /*Crashlytics.sharedInstance().setUserEmail(user.email)
//            Crashlytics.sharedInstance().setUserIdentifier(String(user.id))
//            Crashlytics.sharedInstance().setUserName(user.fullName)*/
//        } else {
//            // Appsee.setUserID("")
//
//            /*Crashlytics.sharedInstance().setUserName(nil)
//            Crashlytics.sharedInstance().setUserIdentifier(nil)
//            Crashlytics.sharedInstance().setUserName(nil)*/
//        }
//    }
//
//    static func dismissPopups() {
//        /*for weakVC in Globals.shared.popupViewControllers {
//            weakVC.value?.dismiss(animated: false, completion: nil)
//        }
//        Globals.shared.popupViewControllers.removeAll()*/
//    }
//
//    static func isConnectedToInternet() -> Bool {
//        return Reachability.init()!.connection != .none
//    }
    
}

extension NSDictionary {
    func toString() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self as AnyObject, options: JSONSerialization.WritingOptions.prettyPrinted)
            return NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue) as String?
        } catch _ as NSError {
            return nil
        }
    }
}

extension NSDictionary {
    
    func toJSONString() -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted)
            let json = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
            if let json = json {
                return json as String
            }
        } catch let error as NSError {
            print(error)
        }
        return ""
    }
    
}

extension UINavigationController {
    
    public func presentTransparentNavigationBar() {
        setNavigationBarHidden(false, animated:false)
    }
    
    public func hideTransparentNavigationBar() {
        setNavigationBarHidden(true, animated:true)
    }
    
}

extension UIImage {
    func with(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    func scaleImage(toSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(origin: CGPoint.zero, size: CGSize(width: newSize.width, height: newSize.height)))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func grayScale() -> UIImage {
        let context = CIContext(options: nil)
        let currentFilter = CIFilter(name: "CIPhotoEffectNoir")
        currentFilter!.setValue(CIImage(image: self), forKey: kCIInputImageKey)
        let output = currentFilter!.outputImage
        let cgimg = context.createCGImage(output!,from: output!.extent)
        let processedImage = UIImage(cgImage: cgimg!)
        return processedImage
    }
}


// [start] Height of label with text
extension String {
    func height(for width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font: font], context: nil)
        return actualSize.height
    }
    func width(for height: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: .greatestFiniteMagnitude, height: height)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font: font], context: nil)
        return actualSize.width
    }
}

extension UILabel {
    func textHeight(for width: CGFloat? = nil) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.height(for: width ?? font!.pointSize, font: font)
    }
    func textWidth(for height: CGFloat? = nil) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.width(for: height ?? font!.pointSize, font: font)
    }
}
// [end]

public extension UIWindow {
    public static var visibleViewController: UIViewController? {
        return UIWindow.getVisibleViewController(from: UIApplication.shared.delegate?.window??.rootViewController)
    }
    
    public static func getVisibleViewController(from vc: UIViewController?) -> UIViewController? {
        if let nc = vc as? UINavigationController {
            return UIWindow.getVisibleViewController(from: nc.visibleViewController)
        } else if let tc = vc as? UITabBarController {
            return UIWindow.getVisibleViewController(from: tc.selectedViewController)
        } else {
            if let pvc = vc?.presentedViewController {
                return UIWindow.getVisibleViewController(from: pvc)
            } else {
                return vc
            }
        }
    }
}

extension UICollectionView {
    var centerPoint : CGPoint {
        get {
            return CGPoint(x: self.center.x + self.contentOffset.x, y: 0);
        }
    }
    
    var centerCellIndexPath: IndexPath? {
        if let centerIndexPath = self.indexPathForItem(at: self.centerPoint) {
            return centerIndexPath
        }
        return nil
    }
}

