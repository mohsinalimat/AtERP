//
//  Event+CoreDataProperties.swift
//  Customers@ERP
//
//  Created by Fotios Tragopoulos on 10/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var timestamp: NSDate?
    @NSManaged public var customerID: String?
    @NSManaged public var customerFirstName: String?
    @NSManaged public var customerLastName: String?
    @NSManaged public var customerAddressLine1: String?
    @NSManaged public var customerMobilePhone: String?
    @NSManaged public var customerHousePhone: String?
    @NSManaged public var customerEmail: String?
    @NSManaged public var customerAddressLine2: String?
    @NSManaged public var customerDiscount: String?

}
