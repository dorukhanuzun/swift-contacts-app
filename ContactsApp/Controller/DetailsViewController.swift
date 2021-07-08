//
//  DetailsViewController.swift
//  ContactsApp
//
//  Created by Dorukhan Uzun on 2021-07-08.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var contactPhone: UILabel!
    @IBOutlet weak var contactEmail: UILabel!
    @IBOutlet weak var contactLastName: UILabel!
    @IBOutlet weak var contactFirstName: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func editButtonClicked(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToEditVC", sender: nil)
    }
    
}
