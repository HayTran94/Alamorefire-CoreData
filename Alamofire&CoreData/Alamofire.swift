//
//  APIClient.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/24/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
import UIKit

class APIClient {
     static var groups = [GroupMO]()
    
    static func request() {
        Alamofire.request("http://54.169.184.194/users/vanmanh431@gmail.com/data")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON{ response in
                
                switch response.result {
                case .success:
                    print("Validation Successful")
                case .failure(let error):
                    print(error)
                }
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                
                if let json = response.result.value {
                    let JSONString = convertDictToJSONString(dict: json as! Dictionary)
                    let userData = UserData(JSONString: JSONString)
                    print("userData = \(userData?.toString())")
        
                    // Save via core data
                    CoreDataImpl.save(userData: userData!)
                    
                    // Save via Realm
                    RealmImpl.saveData(userData: userData!)
                }
                
                

        }

    }
    
    class func convertDictToJSONString(dict: Dictionary<String, Any>) -> String {
        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)!
        return jsonString
    }
}
