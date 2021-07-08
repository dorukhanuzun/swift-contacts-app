//
//  ContactTableViewController.swift
//  ContactsApp
//
//  Created by Dorukhan Uzun on 2021-07-08.
//

import UIKit

class ContactsTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var contactsArray = [String]()
    
    var contactManager = ContactManager()
    
    var cellName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        contactManager.fetchContact(contactName: "")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let contact = contactsArray[indexPath.row]
        
        cell.textLabel?.text = contactsArray[1]
        
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        contactManager.fetchContact(contactName: searchBar.text!)
        
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.text = ""
            searchBar.resignFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationVC = segue.destination as! DetailsViewController
        
        if let indexPath = tableView.indexPathForSelectedRow{
//            destinationVC.contactEmail.text = contactsArray[indexPath.row]
        }
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAddVC", sender: nil)
    }
}

extension ContactsTableViewController: ContactModelDelegate{
    func didUpdateContact(_ contactManager: ContactManager, contact: ContactModel) {
        let firstName = contact.first_name
        let lastName = contact.last_name
        let phoneNumber = contact.phone_number
        let email = contact.email
        let imageURL = contact.image_url
        let contactId = contact.contact_id
        
        contactsArray.append(String(contactId))
        contactsArray.append(firstName)
        contactsArray.append(lastName)
        contactsArray.append(email)
        contactsArray.append(phoneNumber)
        contactsArray.append(imageURL)
    }
    
    func didFailWithError(error: Error) {
        
    }
}
