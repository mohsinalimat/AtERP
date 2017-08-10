//
//  Event+CoreDataClass.swift
//  Suppliers@ERP
//
//  Created by Fotios Tragopoulos on 08/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import Foundation
import CoreData

@objc(Event)
public class Event: NSManagedObject {

    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.timestamp = NSDate()
    }
}
