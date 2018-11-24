//
//  User.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/24/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import ObjectMapper

class ExiSharedUser: Mappable{
    var user: ExiUser?
    var permissionId : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        user <- map["user"]
        permissionId <- map["permission_id"]
    }
    
    func toString() -> String {
        return "ExiSharedUser: user  = \(user!.toString()), permissionId = \(permissionId!)"
    }
    
}
