//
//  WebServices.swift
//  Capp
//
//  Created by tannaz on 11/29/17.
//  Copyright © 2017 Capp. All rights reserved.
//


import ReachabilitySwift
import Alamofire
import Arrow
import UIKit

struct WebServices {
    internal typealias Success              = (_ response: JResponse?) -> ()
    internal typealias Failure              = (_ response: JResponse?) -> ()
    
    static func isConnected(failure: Failure? = nil) -> Bool {
        // checking connection
        if (Reachability.init()!.connection == .none) {
            failure?(JResponse.notConnected)
            return false
        }
        return true
    }
    
    static func request(url: String, method: HTTPMethod = .post, params: [String: Any] = [:],
                        resultType: ArrowParsable.Type? = nil,
                        success: Success?, failure: Failure? , haveURLParams: Bool = false , needToken: Bool = true ) {
        var needToken = needToken
        let user = "Delfard"
        
        let password = "JEFuZHJvaWQk"
        
        let credentialData = "\(user):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers: [String: String] = [ "Authorization": "Basic \(base64Credentials)"
                                          ]
        let encoding: ParameterEncoding?
        
        if haveURLParams {
            encoding = URLEncoding(destination: .queryString)
            
        } else {
           encoding = JSONEncoding.default
        }
        print(StoringData.loginToken)
        if  needToken  {
            headers = ["Token" :  StoringData.loginToken! ,
                       "Authorization": "Basic \(base64Credentials)"
            ]
        }
        
        Alamofire.request( url, method: .post, parameters: params,encoding: encoding!, headers: headers).authenticate(user: user, password: password).responseJSON {
            response in
            print(response.request)
            print(response.result.value)
            switch response.result {
            case .success:

                if let json = response.result.value as? [String: Any] {
                    print(json)
                    if let headerToken =  response.response?.allHeaderFields["Token"] as? String {
                        StoringData.loginToken = headerToken
                    }
                    var jResponse = JResponse(resultType.self)
                    jResponse.parse(response.result.value)
                    if jResponse.isSuccess {
                        print(jResponse)
                        needToken = true
                        success?(jResponse)
                    } else {
                        failure?(jResponse)
                    }
                }

                break
            case .failure(let error):
                print(error)
            }
        }
    
        
    }
    
        
    static func cancelRequests(_ url: String) {
        Alamofire.SessionManager.default.session.getTasksWithCompletionHandler
            {
                (dataTasks, uploadTasks, downloadTasks) -> Void in
                
                Alamofire.SessionManager.cancelTasksByUrl(dataTasks     as [URLSessionTask], url: url)
                Alamofire.SessionManager.cancelTasksByUrl(uploadTasks   as [URLSessionTask], url: url)
                Alamofire.SessionManager.cancelTasksByUrl(downloadTasks as [URLSessionTask], url: url)
        }
    }
    
}


extension Alamofire.SessionManager
{
    // cancel tasks by url
    fileprivate static func cancelTasksByUrl(_ tasks: [URLSessionTask], url: String)
    {
        for task in tasks
        {
            let hasPrefix = task.currentRequest?.url?.description.hasPrefix(url)
            if hasPrefix != nil && hasPrefix! == true
            {
                task.cancel()
            }
        }
    }
}

