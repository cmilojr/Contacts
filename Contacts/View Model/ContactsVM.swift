//
//  ContactsVM.swift
//  Contacts
//
//  Created by Camilo Jimenez on 26/11/21.
//

import Foundation

struct ContactsVM {
    let headerOfSecction = ["FAVORITE CONTACTS","OTHER CONTACTS"]
    
    func getContacts(completion: @escaping ([ContactsModel]?, Error?) -> Void) {
        Networking.shared.get(URL(string:(Constants.API.contacts))!) { (res: [ContactsModel]?, error: Error?) in
            if let err = error {
                completion(nil, err)
            } else if let contacts = res {
                completion(contacts, nil)
            }
        }
    }
    
    func filter(contacts: [ContactsModel]) -> [[ContactsModel]] {
        let fav = contacts.filter {
            $0.isFavorite == true
        }
        
        let notFav = contacts.filter {
            $0.isFavorite == false
        }
        
        return [fav,notFav]
    }
}
