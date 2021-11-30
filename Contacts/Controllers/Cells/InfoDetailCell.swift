//
//  InfoDetailCell.swift
//  Contacts
//
//  Created by Camilo Jimenez on 25/11/21.
//

import UIKit

class InfoDetailCell: UITableViewCell {
    @IBOutlet weak var kindOfCell: UILabel!
    @IBOutlet weak var subKindOfCell: UILabel!
    @IBOutlet weak var infoCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setInfoToView(with info: DetailSecctions) {
        if info.subTitle != nil {
            subKindOfCell.text = info.subTitle?.capitalizingFirstLetter()
        } else {
            subKindOfCell.isHidden = true
        }
        
        kindOfCell.text = info.title.uppercased()
        infoCell.text = info.value.uppercased()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
