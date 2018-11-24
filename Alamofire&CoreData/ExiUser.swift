//
//  User.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/24/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import ObjectMapper

class ExiUser : Mappable{
    var id: Int?
    var name: String?
    var email: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
    }
    
    func toString() -> String {
        return "User: id  = \(id), name = \(name)"
    }

}
