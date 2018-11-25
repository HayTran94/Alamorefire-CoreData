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

class GroupDO : Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var type = 0
    @objc dynamic var iconUrl = ""
    let devices = List<DeviceDO>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
