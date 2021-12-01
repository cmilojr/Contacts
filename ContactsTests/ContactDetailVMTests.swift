//
//  ContactDetailVMTests.swift
//  ContactsTests
//
//  Created by Camilo Jimenez on 1/12/21.
//

@testable import Contacts
import XCTest

class ContactDetailVMTests: XCTestCase {
    var contactDetailVM: ContactDetailVM!

    func testConvertNilInSecctions() {
        let contacts = ContactsModel(
            name: nil,
            id: nil,
            companyName: nil,
            isFavorite: nil,
            smallImageURL: nil,
            largeImageURL: nil,
            birthdate: nil,
            phone: nil,
            address: nil
        )

        assert(contactDetailVM.convertDataInSecctions(contact: contacts).count == 0)
    }
    
    func testConvertTwoDataInSecctions() {
        let contacts = ContactsModel(
            name: nil,
            id: nil,
            companyName: nil,
            isFavorite: nil,
            smallImageURL: nil,
            largeImageURL: nil,
            birthdate: nil,
            phone: Phone(work: "work", home: "home", mobile: nil),
            address: nil
        )
        assert(contactDetailVM.convertDataInSecctions(contact: contacts).count == 2)
    }
    
    func testConvertFullDataInSecctions() {
        let contacts = ContactsModel(
            name: nil,
            id: nil,
            companyName: nil,
            isFavorite: nil,
            smallImageURL: nil,
            largeImageURL: nil,
            birthdate: nil,
            phone: Phone(work: "work", home: "home", mobile: "mobile"),
            address: Address(street: "street", city: "city", state: "state", country: "country", zipCode: "zipCode")
        )
        assert(contactDetailVM.convertDataInSecctions(contact: contacts).count == 8)
    }
    
    override func setUp() {
        super.setUp()
        contactDetailVM = ContactDetailVM()
    }
    
    override func tearDown() {
        contactDetailVM = nil
        super.tearDown()
    }
}
