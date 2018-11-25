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

class SharedUserDO : Object {
    @objc dynamic var user : UserDO? = nil
    @objc dynamic var permissionId = 0

}
