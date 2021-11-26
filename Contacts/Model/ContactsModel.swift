//
//  ContactsModel.swift
//  Contacts
//
//  Created by Camilo Jimenez on 26/11/21.
//

import Foundation

struct ContactsModel: Decodable {
    var name: String
    var id: String
    var companyName: String
    var isFavorite: Bool
    var smallImageURL: String
    var largeImageURL: String
    var birthdate: String
    var phone: Phone
    var address: Address
}

struct Phone: Decodable {
    var work: String
    var home: String
    var mobile: String
}

struct Address: Decodable {
    var street: String
    var city: String
    var state: String
    var country: String
    var zipCode: String
}

