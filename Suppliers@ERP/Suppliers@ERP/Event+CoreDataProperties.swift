//
//  Event+CoreDataProperties.swift
//  Suppliers@ERP
//
//  Created by Fotios Tragopoulos on 08/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var timestamp: NSDate?
    @NSManaged public var supplierID: String?
    @NSManaged public var supplierName: String?
    @NSManaged public var supplierAddressLine1: String?
    @NSManaged public var supplierAddressLine2: String?
    @NSManaged public var supplierEmail: String?
    @NSManaged public var supplierPhoneNumber1: String?
    @NSManaged public var supplierPhoneNumber2: String?
    @NSManaged public var supplierCategory: String?

}
