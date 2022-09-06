//
//  NewContactViewController.swift
//  Contacts_App
//
//  Created by Andrey Vanakoff on 30/08/2022.
//

import UIKit

class NewContactViewController: UIViewController {
    
    
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    
    var delegate: NewContactViewControllerDelegate!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.addTarget(
            self,
            action: #selector(firstNameTextFieldDidChanged),
            for: .editingChanged
        )

    }
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        saveAndExit()
    }
    
    
    @IBAction func cancelButonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }


    @objc private func firstNameTextFieldDidChanged() {
        guard let firstName = firstNameTextField.text else { return }
        doneButton.isEnabled = !firstName.isEmpty
    }

    
    private func saveAndExit() {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        
        let fullName = "\(firstName) \(lastName)"
        StorageManager.shared.save(contact: fullName)
        
        delegate.saveContact(fullName)
        dismiss(animated: true)
    }
 
}
