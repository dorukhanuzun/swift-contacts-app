//
//  ContactManager.swift
//  ContactsApp
//
//  Created by Dorukhan Uzun on 2021-07-08.
//

import Foundation

protocol ContactModelDelegate {
    func didUpdateContact(_ contactManager: ContactManager, contact: ContactModel)
    func didFailWithError(error: Error)
}

struct ContactManager {
    let contactURL = "http://127.0.0.1:5000/"
    
    var delegate: ContactModelDelegate?
    
    func fetchContact(contactName: String?){
        var urlString : String
        if contactName != "" {
            urlString = "\(contactURL)/?name=\(contactName!)"
        } else {
            urlString = "\(contactURL)/all"
        }
        performRequest(with: urlString)

    }
    
    func performRequest(with urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
            
                if let safeData = data {
                    if let contacts = self.parseJSON(safeData) {
                        self.delegate?.didUpdateContact(self, contact: contacts)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ contactData: Data) -> ContactModel? {
        let decoder =  JSONDecoder()
        do{
            let decodedData = try decoder.decode(ContactData.self, from: contactData)
            let id = decodedData.contact_id
            let firstName = decodedData.first_name
            let lastName = decodedData.last_name
            let phoneNumber = decodedData.phone_number
            let emailAddress = decodedData.email
            let imageUrl = decodedData.image_url
            let contact = ContactModel(contact_id: id, first_name: firstName, last_name: lastName, email: emailAddress, phone_number: phoneNumber, image_url: imageUrl)

            return contact
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
