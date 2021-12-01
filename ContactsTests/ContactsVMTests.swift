//
//  ContactsVMTests.swift
//  ContactsTests
//
//  Created by Camilo Jimenez on 1/12/21.
//

@testable import Contacts
import XCTest

class ContactsVMTests: XCTestCase {

    var contactsVM: ContactsVM!
    var contacts: [ContactsModel]!
    
    func insertData() -> [ContactsModel] {
        return [
            ContactsModel(
                name: "name",
                id: "1",
                companyName: "company",
                isFavorite: true,
                smallImageURL: "",
                largeImageURL: "",
                birthdate: "",
                phone: nil,
                address: nil
            ),
            ContactsModel(
                name: "name",
                id: "2",
                companyName: "company",
                isFavorite: true,
                smallImageURL: "",
                largeImageURL: "",
                birthdate: "",
                phone: nil,
                address: nil
            ),
            ContactsModel(
                name: "name",
                id: "3",
                companyName: "company",
                isFavorite: false,
                smallImageURL: "",
                largeImageURL: "",
                birthdate: "",
                phone: nil,
                address: nil
            )
        ]
    }
    
    func testGetContactsFromAPI() {
        contactsVM.getContacts { res, error in
            assert(res != nil)
        }
    }
    
    func testFilterSecctionsOfContacts() {
        assert(contactsVM.filter(contacts: contacts).count == 2)
    }
    
    func testFilterFavContacts() {
        let filteredContects = contactsVM.filter(contacts: contacts)
        assert(filteredContects[0].count == 2 && filteredContects[1].count == 1)
    }
    
    func testUpdateContacts() {
        contactsVM.updateInfo(of: &contacts, by: "3", with: true)
        let filteredContects = contactsVM.filter(contacts: contacts)
        assert(filteredContects[0].count == 3 && filteredContects[1].count == 0)
    }

    
    override func tearDown() {
        contactsVM = nil
        contacts = nil
        super.tearDown()
    }
    
    override func setUp(){
        super.setUp()
        contactsVM = ContactsVM()
        contacts = insertData()
    }
}
