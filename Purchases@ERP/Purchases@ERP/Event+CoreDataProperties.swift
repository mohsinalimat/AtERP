//
//  Event+CoreDataProperties.swift
//  Purchases@ERP
//
//  Created by Fotios Tragopoulos on 13/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var timestamp: NSDate?
    @NSManaged public var purchaseID: String?
    @NSManaged public var purchaseItemName: String?
    @NSManaged public var purchaseUnitPrice: String?
    @NSManaged public var purchaseUnit: String?
    @NSManaged public var purchaseAmount: String?
    @NSManaged public var purchaseSupplier: String?
    @NSManaged public var purchaseReceiptNumber: String?
    @NSManaged public var purchaseFinalAmount: String?

}
