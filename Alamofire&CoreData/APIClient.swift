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
    
    static func request() {
        Alamofire.request("http://54.169.184.194/users/vanmanh431@gmail.com/data")
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON { response in
                
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
                    let data = UserData(JSONString: JSONString)
                    print("Data = \(data?.toString())")
                    save(userData: data!)
                }

        }

    }
    
    
    class func save(userData: UserData) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        for exiGroup in userData.groups! {
            let groupCD = GroupMO(context: context)
            groupCD.id = Int32(exiGroup.id!)
            groupCD.name = exiGroup.name!
            groupCD.icon_url = exiGroup.iconUrl!
            groupCD.type = Int32(exiGroup.type!)
            for exiDevice in exiGroup.devices! {
                let deviceCD = DeviceMO(context: context)
                deviceCD.id = Int32(exiDevice.id!)
                deviceCD.user_id = Int32(exiDevice.userId!)
                deviceCD.model_code = exiDevice.modelCode!
                deviceCD.name = exiDevice.name!
                deviceCD.icon_url = exiDevice.iconUrl!
                groupCD.addToDevices(deviceCD)
            }
            do {
//                 try context.save()
            } catch {
                print()
            }
           
        }
        
    }
    
    class func convertDictToJSONString(dict: Dictionary<String, Any>) -> String {
        let jsonData = try? JSONSerialization.data(withJSONObject: dict, options: [])
        let jsonString = String(data: jsonData!, encoding: .utf8)!
        return jsonString
    }
}
