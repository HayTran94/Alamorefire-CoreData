//
//  DeviceMO+CoreDataClass.swift
//  
//
//  Created by Hay Tran Van on 11/24/18.
//
//

import Foundation
import CoreData

@objc(DeviceMO)
public class DeviceMO: NSManagedObject {

    
    func toString() -> String {
        return "DeviceMO: id  = \(id), name = \(name!), iconUrl = \(iconUrl), devices = \(getDeviceString())"
    }
}
