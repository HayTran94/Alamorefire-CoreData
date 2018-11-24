//
//  File.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/24/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import ObjectMapper

class ExiGroup : Mappable{
    var id: Int?
    var name: String?
    var iconUrl: String?
    var type: Int?
    var devices: [ExiDevice]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        devices <- map["devices"]
        iconUrl <- map["icon_url"]
        type <- map["type"]
    }
    
    func toString() -> String {
        return "ExiGroup: id  = \(id!), name = \(name!), devices = \(getDeviceString())"
    }
    
    func getDeviceString() -> String {
        var string = ""
        for device in devices! {
            string = string + ", " + device.toString()
        }
        return string
    }
}
