//
//  CustomerCell.swift
//  Customers@ERP
//
//  Created by Fotios Tragopoulos on 10/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import UIKit

class CustomerCell: UITableViewCell {

    @IBOutlet weak var nameTextField: UILabel!
    @IBOutlet weak var addressTextField: UILabel!
    @IBOutlet weak var phoneTextField: UILabel!
    @IBOutlet weak var timestamp: UILabel!

    func configureCell(customer: Event) {

        if customer.customerFirstName == "" && customer.customerLastName == "" {
            nameTextField.text = "New Customer"
        } else if customer.customerFirstName == "" {
            nameTextField.text = "\(customer.customerLastName ?? "")"
        } else if customer.customerLastName == "" {
            nameTextField.text = "\(customer.customerFirstName ?? "")"
        } else {
            nameTextField.text = "\(customer.customerLastName ?? "New") \(customer.customerFirstName ?? "Customer")"
        }
        
        if customer.customerAddressLine1 == "" && customer.customerAddressLine2 == "" {
            addressTextField.text = "Tap on the Cell to Edit"
        } else if customer.customerAddressLine1 == "" {
            addressTextField.text = "\(customer.customerAddressLine2 ?? "")"
        } else if customer.customerAddressLine2 == "" {
            addressTextField.text = "\(customer.customerAddressLine1 ?? "")"
        } else {
            addressTextField.text = "\(customer.customerAddressLine1 ?? "Tap on the Cell to Edit"), \(customer.customerAddressLine2 ?? "")"
        }
        
        if customer.customerMobilePhone == "" && customer.customerHousePhone == "" {
            phoneTextField.text = ""
        } else if customer.customerMobilePhone == "" {
            phoneTextField.text = "\(customer.customerHousePhone ?? "")"
        } else if customer.customerHousePhone == "" {
            phoneTextField.text = "\(customer.customerMobilePhone ?? "")"
        } else {
            phoneTextField.text = "\(customer.customerMobilePhone ?? "") - \(customer.customerHousePhone ?? "")"
        }
        
        let myString = customer.timestamp!.description
        
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
        
        timestamp.text = "\(myString.substring(with: timeRange)) - \(myString.substring(with: dayRange)).\(myString.substring(with: monthRange)).\(myString.substring(with: yearRange))"
    }
}
