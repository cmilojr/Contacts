//
//  ContactDetailVM.swift
//  Contacts
//
//  Created by Camilo Jimenez on 26/11/21.
//

import Foundation

struct ContactDetailVM {
    func convertDataInSecctions(contact data: ContactsModel) -> [DetailSecctions] {
        var arrDetailContact = [DetailSecctions]()
        if let phoneHome = data.phone?.home {
            arrDetailContact.append(
                DetailSecctions(
                    title: Constants.ContactTitles.phone,
                    subTitle: Constants.ContactTitles.home, value: phoneHome))

        }
        
        if let phoneWork = data.phone?.work {
            arrDetailContact.append(
                DetailSecctions(
                    title: Constants.ContactTitles.phone,
                    subTitle: Constants.ContactTitles.work, value: phoneWork))

        }
        
        if let phoneMobile = data.phone?.mobile {
            arrDetailContact.append(
                DetailSecctions(
                    title: Constants.ContactTitles.phone,
                    subTitle: Constants.ContactTitles.mobile, value: phoneMobile))

        }
        
        if let street = data.address?.street {
            arrDetailContact.append(
                DetailSecctions(
                    title: Constants.ContactTitles.street,
                    value: street))

        }
        
        if let city = data.address?.city {
            arrDetailContact.append(
                DetailSecctions(
                    title: Constants.ContactTitles.city,
                    value: city))

        }
        
        if let state = data.address?.state {
            arrDetailContact.append(
                DetailSecctions(
                    title: Constants.ContactTitles.state,
                    value: state))

        }

        if let country = data.address?.country {
            arrDetailContact.append(
                DetailSecctions(
                    title: Constants.ContactTitles.country,
                    value: country))

        }

        if let zipCode = data.address?.zipCode {
            arrDetailContact.append(
                DetailSecctions(
                    title: Constants.ContactTitles.zipCode,
                    value: zipCode))

        }
        
        return arrDetailContact
    }
}
