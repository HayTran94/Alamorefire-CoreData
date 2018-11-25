//
//  Group.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/25/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import RealmSwift


class UserDO : Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var email = ""
    @objc dynamic var iconUrl = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
