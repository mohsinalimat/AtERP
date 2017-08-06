//
//  Event+CoreDataProperties.swift
//  Employees@ERP
//
//  Created by Fotios Tragopoulos on 01/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var employeeAddress: String?
    @NSManaged public var employeeEmail: String?
    @NSManaged public var employeeFirstName: String?
    @NSManaged public var employeeHousePhone: String?
    @NSManaged public var employeeID: String?
    @NSManaged public var employeeLastName: String?
    @NSManaged public var employeeMobilePhone: String?
    @NSManaged public var timestamp: NSDate?
    @NSManaged public var employeeDepartment: String?

}
