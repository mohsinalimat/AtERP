//
//  DetailViewController.swift
//  Suppliers@ERP
//
//  Created by Fotios Tragopoulos on 07/08/2017.
//  Copyright © 2017 Fotios Tragopoulos. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UISplitViewControllerDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var address1TextField: UITextField!
    @IBOutlet weak var address2TextField: UITextField!
    @IBOutlet weak var phone1TextField: UITextField!
    @IBOutlet weak var phone2TextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var savedLabel: UILabel!
    @IBOutlet weak var tickLabel: UILabel!
    @IBOutlet weak var saveChanges: UIButton!
    @IBOutlet weak var saveButton: UIBarButtonItem!

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
        categoryTextField.delegate = self
        nameTextField.delegate = self
        address1TextField.delegate = self
        address2TextField.delegate = self
        phone1TextField.delegate = self
        phone2TextField.delegate = self
        emailTextField.delegate = self
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        let item = Event(context: context)
        if let id = idTextField.text {
            item.supplierID = id
        }
        if let department = categoryTextField.text {
            item.supplierCategory = department
        }
        if let name = nameTextField.text {
            item.supplierName = name
        }
        if let address1 = address1TextField.text {
            item.supplierAddressLine1 = address1
        }
        if let address2 = address2TextField.text {
            item.supplierAddressLine2 = address2
        }
        if let phone1 = phone1TextField.text {
            item.supplierPhoneNumber1 = phone1
        }
        if let phone2 = phone2TextField.text {
            item.supplierPhoneNumber2 = phone2
        }
        if let email = emailTextField.text {
            item.supplierEmail = email
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
        
        if let id = idTextField.text {
            item.supplierID = id
        }
        if let department = categoryTextField.text {
            item.supplierCategory = department
        }
        if let name = nameTextField.text {
            item.supplierName = name
        }
        if let address1 = address1TextField.text {
            item.supplierAddressLine1 = address1
        }
        if let address2 = address2TextField.text {
            item.supplierAddressLine2 = address2
        }
        if let phone1 = phone1TextField.text {
            item.supplierPhoneNumber1 = phone1
        }
        if let phone2 = phone2TextField.text {
            item.supplierPhoneNumber2 = phone2
        }
        if let email = emailTextField.text {
            item.supplierEmail = email
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
            idTextField.text = item.supplierID
            categoryTextField.text = item.supplierCategory
            nameTextField.text = item.supplierName
            address1TextField.text = item.supplierAddressLine1
            address2TextField.text = item.supplierAddressLine2
            phone1TextField.text = item.supplierPhoneNumber1
            phone2TextField.text = item.supplierPhoneNumber2
            emailTextField.text = item.supplierEmail
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

