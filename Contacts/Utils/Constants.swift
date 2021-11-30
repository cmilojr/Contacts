//
//  Constants.swift
//  iBuy
//
//  Created by Camilo Jimenez on 6/08/21.
//

import UIKit

struct Constants {
    struct API {
        static let contacts = "https://s3.amazonaws.com/technical-challenge/v3/contacts.json"
    }
    
    struct CellIdentifier {
        static let contactCell = "ContactCell"
        static let infoDetailCell = "InfoDetailCell"
    }
    
    struct SegueIdentifier {
        static let showDetailSegue = "showDetailSegue"
    }
    
    struct ContactTitles {
        static let phone = "phone"
        static let work = "work"
        static let home = "home"
        static let mobile = "mobile"
        static let street = "street"
        static let city = "city"
        static let state = "state"
        static let country = "country"
        static let zipCode = "zip code"
    }
}

