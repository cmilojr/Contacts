//
//  NetworkingTests.swift
//  PokeAPITests
//
//  Created by Camilo Jimenez on 15/09/21.
//
@testable import Contacts
import XCTest

class NetworkingTests: XCTestCase {
    var networking = Networking.shared
    
    func testGetListUrlTestError() throws {
        networking.get(URL(string: "www.error-1.com")!) { (res: [ContactsModel]?, error: Error?) in
            assert(error != nil)
        }
    }
   
    func testGetListUrlTest() throws {
        networking.get(URL(string: Constants.API.contacts)!) { (res: [ContactsModel]?, error: Error?) in
            assert(res != nil)
        }
    }

    override class func tearDown() {
        super.tearDown()
    }
}
