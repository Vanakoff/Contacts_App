//
//  ViewController.swift
//  Contacts_App
//
//  Created by Andrey Vanakoff on 30/08/2022.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContact(_ contact: Contact)
}

class ContactListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private var contacts: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contacts = StorageManager.shared.fetchContacts()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! NewContactViewController
        newContactVC.delegate = self
    }

}

//MARK: - UITableViewDataSource

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let contact = contacts[indexPath.row].fullName
        var content = cell.defaultContentConfiguration()
        content.text = contact
    //    content.secondaryText = contact
        cell.contentConfiguration = content
        
        return cell
    }
    
    
}

//MARK: - UITableViewDelegate

extension ContactListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            StorageManager.shared.deleteContact(at: indexPath.row)
            contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

//MARK: - NewContactViewControllerDelegate

extension ContactListViewController: NewContactViewControllerDelegate {
    func saveContact(_ contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}
