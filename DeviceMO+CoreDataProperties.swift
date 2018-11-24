//
//  DeviceMO+CoreDataProperties.swift
//  
//
//  Created by Hay Tran Van on 11/24/18.
//
//

import Foundation
import CoreData


extension DeviceMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DeviceMO> {
        return NSFetchRequest<DeviceMO>(entityName: "Device")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var group_id: Int32
    @NSManaged public var mac_address: String?
    @NSManaged public var model_code: String?
    @NSManaged public var user_id: Int32
    @NSManaged public var icon_url: String?
    @NSManaged public var group: GroupMO?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension DeviceMO {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: UserMO)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: UserMO)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}
