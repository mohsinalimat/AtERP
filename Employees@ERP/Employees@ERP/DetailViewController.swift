//
//  DetailViewController.swift
//  Employees@ERP
//
//  Created by Fotios Tragopoulos on 31/07/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UISplitViewControllerDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var departmentTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var address1TextField: UITextField!
    @IBOutlet weak var mobilePhoneTextField: UITextField!
    @IBOutlet weak var housePhoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
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
        
        idTextField.delegate = self
        departmentTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        address1TextField.delegate = self
        mobilePhoneTextField.delegate = self
        housePhoneTextField.delegate = self
        emailTextField.delegate = self
    }

    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let item = Event(context: context)
        if let id = idTextField.text {
            item.employeeID = id
        }
        if let department = departmentTextField.text {
            item.employeeDepartment = department
        }
        if let firstName = firstNameTextField.text {
            item.employeeFirstName = firstName
        }
        if let lastName = lastNameTextField.text {
            item.employeeLastName = lastName
        }
        if let address = address1TextField.text {
            item.employeeAddress = address
        }
        if let mobilePhone = mobilePhoneTextField.text {
            item.employeeMobilePhone = mobilePhone
        }
        if let housePhone = housePhoneTextField.text {
            item.employeeHousePhone = housePhone
        }
        if let email = emailTextField.text {
            item.employeeEmail = email
        }
        
        ad.saveContext()
        
        //Animates the Saved Label
        savedLabel.isHidden = false
        tickLabel.isHidden = false
        fade(animatedView: savedLabel)
        animate(animatedView: tickLabel)
        
        //Shows the Root View on iPhone
        self.view.endEditing(true)
        self.navigationController?.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveChanges(_ sender: Any) {
        var item: Event!
        
        if itemToEdit == nil {
            item = Event(context: context)
        } else {
            item = itemToEdit
        }
        
        if let id = idTextField.text {
            item.employeeID = id
        }
        if let department = departmentTextField.text {
            item.employeeDepartment = department
        }
        if let firstName = firstNameTextField.text {
            item.employeeFirstName = firstName
        }
        if let lastName = lastNameTextField.text {
            item.employeeLastName = lastName
        }
        if let address = address1TextField.text {
            item.employeeAddress = address
        }
        if let mobilePhone = mobilePhoneTextField.text {
            item.employeeMobilePhone = mobilePhone
        }
        if let housePhone = housePhoneTextField.text {
            item.employeeHousePhone = housePhone
        }
        if let email = emailTextField.text {
            item.employeeEmail = email
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
            idTextField.text = item.employeeID
            departmentTextField.text = item.employeeDepartment
            firstNameTextField.text = item.employeeFirstName
            lastNameTextField.text = item.employeeLastName
            address1TextField.text = item.employeeAddress
            mobilePhoneTextField.text = item.employeeMobilePhone
            housePhoneTextField.text = item.employeeHousePhone
            emailTextField.text = item.employeeEmail
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
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}

