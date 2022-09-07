//
//  Contact.swift
//  Contacts_App
//
//  Created by Andrey Vanakoff on 07/09/2022.
//

struct Contact: Codable {
    let name: String
    let surname: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
}
