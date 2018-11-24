//
//  Device.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/24/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import ObjectMapper

class ExiDevice: Mappable{
    var id: Int?
    var macAddress: String?
    var modelCode: String?
    var name: String?
    var iconUrl: String?
    var userId: Int?
    var sharedUsers: [ExiUser]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        macAddress <- map["mac_address"]
        modelCode <- map["model_code"]
        name <- map["name"]
        userId <- map["user_id"]
        iconUrl <- map["icon_url"]
        sharedUsers <- map["sharedUsers"]
    }
    
    func toString() -> String {
        return "ExiDevice: id  = \(id!), name = \(name!), macAddr = \(macAddress!), sharedUsers = \(getUserString())"
    }
    
    func getUserString() -> String {
        var string = ""
        for user in sharedUsers! {
            string = string + ", " + user.toString()
        }
        return string
    }
}
