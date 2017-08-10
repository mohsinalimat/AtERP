//
//  SavedView.swift
//  Customers@ERP
//
//  Created by Fotios Tragopoulos on 10/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {
    
    @IBInspectable var savedDesign: Bool {
        get {
            
            return materialKey
        }
        set {
            materialKey = newValue
            
            if materialKey {
                self.layer.masksToBounds = true
                self.layer.cornerRadius = 20.0
            }   else    {
                self.layer.cornerRadius = 0
            }
        }
    }
}
