//
//  CoreData.swift
//  Alamofire&CoreData
//
//  Created by Hay Tran Van on 11/25/18.
//  Copyright © 2018 Hay Tran Van. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataImpl {
    
    class func save(userData: UserData) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        // Iterator in groups
        for exiGroup in userData.groups! {
            let groupMO = GroupMO(context: context)
            groupMO.id = Int32(exiGroup.id!)
            groupMO.name = exiGroup.name!
            groupMO.icon_url = exiGroup.iconUrl == nil ? "" : exiGroup.iconUrl!
            groupMO.type = Int32(exiGroup.type!)
            // Iterator in devices
            for exiDevice in exiGroup.devices! {
                let deviceMO = DeviceMO(context: context)
                deviceMO.id = Int32(exiDevice.id!)
                deviceMO.user_id = Int32(exiDevice.userId == nil ? 0 : exiDevice.userId!)
                deviceMO.model_code = exiDevice.modelCode!
                deviceMO.name = exiDevice.name!
                deviceMO.icon_url = exiDevice.iconUrl == nil ? "" : exiDevice.iconUrl!
                
                // Iterator in shared users
                for user in exiDevice.sharedUsers! {
                    let userMO = UserMO(context: context)
                    userMO.id = Int32(user.user!.id!)
                    userMO.name = user.user!.name == nil ? "" : user.user!.name!
                    userMO.email = user.user!.email!
                    userMO.icon_url = user.user!.iconUrl == nil ? "" : user.user!.iconUrl!
                    deviceMO.addToUsers(userMO)
                }
                
                groupMO.addToDevices(deviceMO)
            }
            do {
                try context.save()
            } catch {
                print()
            }
            
        }
    }
    
    class func getData() {
        var groups = [GroupMO]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do {
            groups = try context.fetch(GroupMO.fetchRequest())
            var groupString = ""
            // Iterator in groups
            for group in groups {
                var deviceString = ""
                // Iterator in devices
                for device in group.devices! {
                    
                    var userString = ""
                    // Iterator in shared user
                    for user in (device as! DeviceMO).users! {
                        userString = userString + (user as! UserMO).name!
                    }
                    deviceString = deviceString + "{" + (device as! DeviceMO).name! + ": user = " + userString + "}"
                }
                groupString = groupString +  "{" + group.name! + "{device = " + deviceString + "}"
                
            }
            print("group = \(groupString)")
        } catch {
            print("Fetching Failed")
        }
    }
}
