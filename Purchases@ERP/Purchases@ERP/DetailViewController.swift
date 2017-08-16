//
//  DetailViewController.swift
//  Purchases@ERP
//
//  Created by Fotios Tragopoulos on 13/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UISplitViewControllerDelegate {

//    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var purchaseID: UITextField!
    @IBOutlet weak var purchaseReceiptNumber: UITextField!
    @IBOutlet weak var purchaseItemName: UITextField!
    @IBOutlet weak var purchaseSupplier: UITextField!
    @IBOutlet weak var purchaseUnit: UITextField!
    @IBOutlet weak var purchaseUnitPrice: UITextField!
    @IBOutlet weak var purchaseAmount: UITextField!
    @IBOutlet weak var purchaseTotalPrice: UITextField!
    @IBOutlet weak var saveChanges: UIButton!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var savedLabel: UILabel!
    @IBOutlet weak var tickLabel: UILabel!

    var itemToEdit: Event?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        saveChanges.isHidden = true
        savedLabel.isHidden = true
        tickLabel.isHidden = true
        
        if itemToEdit != nil {
            loadItemData()
            saveChanges.isHidden = false
            saveButton.title = "Save New"
        }
        
        purchaseID.delegate = self
        purchaseReceiptNumber.delegate = self
        purchaseItemName.delegate = self
        purchaseSupplier.delegate = self
        purchaseUnit.delegate = self
        purchaseUnitPrice.delegate = self
        purchaseAmount.delegate = self
        purchaseTotalPrice.delegate = self
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let item = Event(context: context)
        if let id = purchaseID.text {
            item.purchaseID = id
        }
        if let receiptNumber = purchaseReceiptNumber.text {
            item.purchaseReceiptNumber = receiptNumber
        }
        if let itemName = purchaseItemName.text {
            item.purchaseItemName = itemName
        }
        if let supplierName = purchaseSupplier.text {
            item.purchaseSupplier = supplierName
        }
        if let unit = purchaseUnit.text {
            item.purchaseUnit = unit
        }
        if let unitPrice = purchaseUnitPrice.text {
            item.purchaseUnitPrice = unitPrice
        }
        if let amount = purchaseAmount.text {
            item.purchaseAmount = amount
        }
        if let totalPrice = purchaseTotalPrice.text {
            item.purchaseFinalAmount = totalPrice
        }
        
        ad.saveContext()
        
        //Animates the Saved Label
        savedLabel.isHidden = false
        tickLabel.isHidden = false
        fade(animatedView: savedLabel)
        animate(animatedView: tickLabel)
        
        //Shows the Root View on iPhone
        self.view.endEditing(true)
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        var item: Event!
        
        if itemToEdit == nil {
            item = Event(context: context)
        } else {
            item = itemToEdit
        }
        
        if let id = purchaseID.text {
            item.purchaseID = id
        }
        if let receiptNumber = purchaseReceiptNumber.text {
            item.purchaseReceiptNumber = receiptNumber
        }
        if let itemName = purchaseItemName.text {
            item.purchaseItemName = itemName
        }
        if let supplierName = purchaseSupplier.text {
            item.purchaseSupplier = supplierName
        }
        if let unit = purchaseUnit.text {
            item.purchaseUnit = unit
        }
        if let unitPrice = purchaseUnitPrice.text {
            item.purchaseUnitPrice = unitPrice
        }
        if let amount = purchaseAmount.text {
            item.purchaseAmount = amount
        }
        if let totalPrice = purchaseTotalPrice.text {
            item.purchaseFinalAmount = totalPrice
        }
        
        ad.saveContext()
        
        //Animates the Saved Label
        savedLabel.isHidden = false
        tickLabel.isHidden = false
        fade(animatedView: savedLabel)
        animate(animatedView: tickLabel)
        
        //Shows the Root View on iPhone
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    //Dismiss the keyboard when touching on the UIView
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func loadItemData() {
        if let item = itemToEdit {
            purchaseID.text = item.purchaseID
            purchaseReceiptNumber.text = item.purchaseReceiptNumber
            purchaseItemName.text = item.purchaseItemName
            purchaseSupplier.text = item.purchaseSupplier
            purchaseUnit.text = item.purchaseUnit
            purchaseUnitPrice.text = item.purchaseUnitPrice
            purchaseAmount.text = item.purchaseAmount
            purchaseTotalPrice.text = item.purchaseFinalAmount
//            
//            let myString = item.timestamp!.description
//            
//            let timeStart = myString.index(myString.startIndex, offsetBy: 11)
//            let timeEnd = myString.index(myString.endIndex, offsetBy: -6)
//            let timeRange = timeStart..<timeEnd
//            
//            let dayStart = myString.index(myString.startIndex, offsetBy: 8)
//            let dayEnd = myString.index(myString.endIndex, offsetBy: -15)
//            let dayRange = dayStart..<dayEnd
//            
//            let monthStart = myString.index(myString.startIndex, offsetBy: 5)
//            let monthEnd = myString.index(myString.endIndex, offsetBy: -18)
//            let monthRange = monthStart..<monthEnd
//            
//            let yearStart = myString.index(myString.startIndex, offsetBy: 2)
//            let yearEnd = myString.index(myString.endIndex, offsetBy: -21)
//            let yearRange = yearStart..<yearEnd
//            
//            detailDescriptionLabel.text = "\(myString.substring(with: timeRange)) - \(myString.substring(with: dayRange)).\(myString.substring(with: monthRange)).\(myString.substring(with: yearRange))"
        }
    }
    
    func animate(animatedView: UIView) {
        animatedView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.2, delay: 0.2, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.tickLabel.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.15, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: { animatedView.transform = CGAffineTransform.identity } ,completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.tickLabel.alpha = 0.0
        }, completion: nil)
    }
    func fade(animatedView: UIView) {
        animatedView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.savedLabel.alpha = 1.0
        }, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.savedLabel.alpha = 0.0
        }, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            // Handles the showDetail segue
            self.navigationController?.navigationController?.popToRootViewController(animated: true)
            // Handles the showDetailNew segue
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
