//
//  ContactsTableViewCell.swift
//  ContactsApp
//
//  Created by Dorukhan Uzun on 2021-07-08.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var fullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
