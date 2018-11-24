//
//  GroupMO+CoreDataProperties.swift
//  
//
//  Created by Hay Tran Van on 11/24/18.
//
//

import Foundation
import CoreData


extension GroupMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroupMO> {
        return NSFetchRequest<GroupMO>(entityName: "Group")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var icon_url: String?
    @NSManaged public var type: Int32
    @NSManaged public var devices: NSSet?

}

// MARK: Generated accessors for devices
extension GroupMO {

    @objc(addDevicesObject:)
    @NSManaged public func addToDevices(_ value: DeviceMO)

    @objc(removeDevicesObject:)
    @NSManaged public func removeFromDevices(_ value: DeviceMO)

    @objc(addDevices:)
    @NSManaged public func addToDevices(_ values: NSSet)

    @objc(removeDevices:)
    @NSManaged public func removeFromDevices(_ values: NSSet)

}
