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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func cancelButonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

}
