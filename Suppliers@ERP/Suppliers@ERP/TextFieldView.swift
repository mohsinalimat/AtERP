//
//  TextFieldView.swift
//  Suppliers@ERP
//
//  Created by Fotios Tragopoulos on 23/07/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import UIKit

private var materialKey = false

extension UITextField {
    
    @IBInspectable var textFieldDesign: Bool {
        get {
            return materialKey
        }
        set {
            materialKey = newValue
            
            if materialKey {
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: self.frame.height))
                self.leftView = paddingView
                self.leftViewMode = UITextFieldViewMode.always
            }   else    {
                let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: self.frame.height))
                self.leftView = paddingView
                self.leftViewMode = UITextFieldViewMode.always
            }
        }
    }
}
