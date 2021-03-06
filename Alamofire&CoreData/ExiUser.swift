//
//  User.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/24/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import ObjectMapper

class ExiUser: Mappable{
    var id: Int?
    var name: String?
    var email: String?
    var iconUrl: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        email <- map["email"]
        iconUrl <- map["icon_url"]
        name <- map["name"]
    }
    
    func toString() -> String {
        return "ExiUser: id  = \(id), name = \(name), email = \(email) iconUrl = \(iconUrl)"
    }
    
}
