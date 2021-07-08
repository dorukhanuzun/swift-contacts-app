//
//  ContactData.swift
//  ContactsApp
//
//  Created by Dorukhan Uzun on 2021-07-08.
//

import Foundation

struct ContactData: Codable {
    let contact_id : Int
    let first_name : String
    let last_name : String
    let email : String
    let phone_number : String
    let image_url : String
}
