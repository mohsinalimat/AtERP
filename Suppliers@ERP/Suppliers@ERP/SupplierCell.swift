//
//  EmployeeTableViewCell.swift
//  Suppliers@ERP
//
//  Created by Fotios Tragopoulos on 02/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import UIKit

class SupplierCell: UITableViewCell {

    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var categoryTextField: UILabel!
    @IBOutlet weak var dateTextField: UILabel!

    func configureCell(supplier: Event) {

        nameTextField.text = "\(supplier.supplierName ?? "New Supplier")"
        categoryTextField.text = supplier.supplierCategory ?? "Tap on the Cell to Edit"
        
        let myString = supplier.timestamp!.description
        
        let timeStart = myString.index(myString.startIndex, offsetBy: 11)
        let timeEnd = myString.index(myString.endIndex, offsetBy: -6)
        let timeRange = timeStart..<timeEnd
        
        let dayStart = myString.index(myString.startIndex, offsetBy: 8)
        let dayEnd = myString.index(myString.endIndex, offsetBy: -15)
        let dayRange = dayStart..<dayEnd
        
        let monthStart = myString.index(myString.startIndex, offsetBy: 5)
        let monthEnd = myString.index(myString.endIndex, offsetBy: -18)
        let monthRange = monthStart..<monthEnd
        
        let yearStart = myString.index(myString.startIndex, offsetBy: 2)
        let yearEnd = myString.index(myString.endIndex, offsetBy: -21)
        let yearRange = yearStart..<yearEnd
        
        dateTextField.text = "\(myString.substring(with: timeRange)) - \(myString.substring(with: dayRange)).\(myString.substring(with: monthRange)).\(myString.substring(with: yearRange))"
    }
    
}
