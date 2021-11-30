//
//  ContactsVM.swift
//  Contacts
//
//  Created by Camilo Jimenez on 26/11/21.
//

import Foundation

struct ContactsVM {
    
    func getContacts(completion: @escaping ([ContactsModel]?, Error?) -> Void) {
        Networking.shared.get(URL(string:(Constants.API.contacts))!) { (res: [ContactsModel]?, error: Error?) in
            if let err = error {
                completion(nil, err)
            } else if let contacts = res {
                completion(contacts, nil)
            }
        }
    }
}
