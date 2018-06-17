//
//  APIRouter.swift
//  iOS Proficiency Test
//
//  Created by Anand R Nair on 17/06/18.
//  Copyright © 2018 Anand R Nair. All rights reserved.
//

import UIKit
import Reachability
import SVProgressHUD
import SwiftyJSON

enum Method: String {
    case GET = "GET"
    case POST = "POST"
    case PATCH = "PATCH"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

let baseUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/"

// API Router to consume the REST service
class APIRouter: NSObject {
    
    class func dataTaskWithMethod(_ method: Method, path: String, shouldShowHUD: Bool = true, completionHandler: @escaping (_ dictDict: [String: Any]?, _ error: NSError?) -> ()) {
        
        // check network availablity
        let reachability = Reachability()
        if reachability?.connection == Reachability.Connection.none{
            
            // show no network alert
            Alert.ok(&&"alert_title_network_unreachable", &&"alert_message_network_unreachable")
            
            // no network
            print("no network connection")
            return
        }
        
        let url : String = baseUrl + path
        let request: NSMutableURLRequest = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = method.rawValue
        let session = URLSession.shared
        
        if shouldShowHUD {
            onmain {
                SVProgressHUD.show()
            }
        }
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            
            guard let data = data, error == nil else {
                let error = NSError(domain: "", code: 1000, userInfo: nil)
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    completionHandler(nil, error)
                }
                return
            }
            
            let jsonString = String.init(data: data, encoding: String.Encoding.ascii) ?? ""
            
            let dict = convertToDictionary(text: jsonString)
            
            print("\nresponse of \(String(describing: request.url)) is\n \(String(describing: dict))")
            
            // success
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
                completionHandler(dict, nil)
            }
        })
        
        task.resume()
        
    }
    
    class func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
