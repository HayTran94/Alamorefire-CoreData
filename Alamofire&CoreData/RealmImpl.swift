//
//  RealmImpl.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/25/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class RealmImpl {
    
    class func saveData(userData: UserData) {
        // Iterator in groups
        for exiGroup in userData.groups! {
            let groupDO = GroupDO()
            if (exiGroup.id! != 0) {
                groupDO.id = exiGroup.id!
            } else {
                groupDO.id = exiGroup.type! * -1
            }
        
            groupDO.name = exiGroup.name!
            groupDO.iconUrl = exiGroup.iconUrl == nil ? "" : exiGroup.iconUrl!
            groupDO.type = exiGroup.type!
            // Iterator in devices
            for exiDevice in exiGroup.devices! {
                let deviceDO = DeviceDO()
                deviceDO.id = Int32(exiDevice.id!)
                deviceDO.userId = exiDevice.userId == nil ? 0 : exiDevice.userId!
                deviceDO.modelCode = exiDevice.modelCode!
                deviceDO.name = exiDevice.name!
                deviceDO.macAddr = exiDevice.macAddress!
                deviceDO.iconUrl = exiDevice.iconUrl == nil ? "" : exiDevice.iconUrl!
                
                // Iterator in shared users
                for user in exiDevice.sharedUsers! {
                    let sharedUserDO = SharedUserDO()
                    let userDO = UserDO()
                    userDO.id = user.user!.id!
                    userDO.name = user.user!.name == nil ? "" : user.user!.name!
                    userDO.email = user.user!.email!
                    userDO.iconUrl = user.user!.iconUrl == nil ? "" : user.user!.iconUrl!
                    sharedUserDO.user = userDO
                    sharedUserDO.permissionId = user.permissionId!
                    deviceDO.sharedUsers.append(sharedUserDO)
                }
                
                groupDO.devices.append(deviceDO)
            }
            
            let realm = try! Realm()
            try! realm.write({
                realm.add(groupDO, update: true)
            })
            
        }
    }
    
    
    class func getData() {
        
    }
}
