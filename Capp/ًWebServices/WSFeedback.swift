//
//  WSFeedback.swift
//  Capp
//
//  Created by Tannaz Parsa on 2/26/18.
//  Copyright © 2018 Capp. All rights reserved.
//

import Foundation
extension WebServices {
    
    static func sendFeedback(_ title: String , feedbackType: Int , message: String , success: Success? = nil, failure: Failure? = nil) {
        
        // checking connection
        if !isConnected(failure: failure) {
            return
        }
        let params = ["FeedBackTypeID": feedbackType,
                      "Title": title,
                      "Message" : message
                      ] as [String : Any]
        
        // call web service
        request(url: URLs.feedback,params: params, resultType: JResponse.self,success: success, failure: failure , haveURLParams: false)
    }
}
