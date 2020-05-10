//
//  WebViewHelper.swift
//  Chilivery
//
//  Created by Sina Khalili on 9/25/17.
//  Copyright © 2017 IMBCo. All rights reserved.
//

import Foundation
import UIKit

class WebViewHelper  {
    static func openAlexaWebView(in viewController: UIViewController) {
        let webView = UIWebView(frame: CGRect(x:0,y: 0,width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height))
      //  webView.loadRequest(URLRequest(url: URL(string: URLs.alexa)!))
        webView.isHidden = true
        viewController.view.addSubview(webView)
    }
}
