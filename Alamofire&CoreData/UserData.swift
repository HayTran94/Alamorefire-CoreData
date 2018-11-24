//
//  Data.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/24/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import ObjectMapper

class UserData : Mappable{
    var user: ExiUser?
    var groups: [ExiGroup]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        groups <- map["groups"]
        user <- map["user"]
    }
    
    func toString() -> String {
        return "UserData: user  = \(user!.toString()), groups = \(getGroupString())"
    }
    
    func getGroupString() -> String {
        var string = ""
        for group  in groups! {
            string = string + ", " + group.toString()
        }
        return string
    }
}
