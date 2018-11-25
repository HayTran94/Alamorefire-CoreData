//
//  Group.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/25/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class DeviceDO : Object {
    @objc dynamic var id : Int32 = 0
    @objc dynamic var name = ""
    @objc dynamic var macAddr = ""
    @objc dynamic var modelCode = ""
    @objc dynamic var userId = 0
    @objc dynamic var iconUrl = ""
    let sharedUsers = List<SharedUserDO>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
