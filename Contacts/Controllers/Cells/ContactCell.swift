//
//  ContactCell.swift
//  Contacts
//
//  Created by Camilo Jimenez on 25/11/21.
//

import UIKit

class ContactCell: UITableViewCell {
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setInfoToView(with contact: ContactsModel) {
        if let isFavorite = contact.isFavorite {
            self.starImage.image = isFavorite ? UIImage(named: "StarFill") : UIImage(named: "StarNotFill")
        }
        
        if let smallImageURL = contact.smallImageURL {
            self.contactImage.download(from: smallImageURL)
        }
        
        if let name = contact.name {
            self.contactNameLabel.text = name
        }
        
        if (contact.companyName != "") {
            self.contactInfoLabel.text = contact.companyName
        } else {
            self.contactInfoLabel.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
