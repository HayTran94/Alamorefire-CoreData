//
//  UserMO+CoreDataProperties.swift
//  
//
//  Created by Hay Tran Van on 11/24/18.
//
//

import Foundation
import CoreData


extension UserMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserMO> {
        return NSFetchRequest<UserMO>(entityName: "User")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var icon_url: String?
    @NSManaged public var devices: NSSet?

}

// MARK: Generated accessors for devices
extension UserMO {

    @objc(addDevicesObject:)
    @NSManaged public func addToDevices(_ value: DeviceMO)

    @objc(removeDevicesObject:)
    @NSManaged public func removeFromDevices(_ value: DeviceMO)

    @objc(addDevices:)
    @NSManaged public func addToDevices(_ values: NSSet)

    @objc(removeDevices:)
    @NSManaged public func removeFromDevices(_ values: NSSet)

}
