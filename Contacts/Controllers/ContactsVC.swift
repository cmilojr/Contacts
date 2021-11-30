//
//  ContactsVC.swift
//  Contacts
//
//  Created by Camilo Jimenez on 25/11/21.
//

import UIKit
import NotificationBannerSwift

class ContactsVC: UIViewController {
    @IBOutlet weak var contactsTableView: UITableView!
    
    let contactsVM = ContactsVM()
    
    var contacts: [ContactsModel] = [] {
        didSet {
            self.contactsFiltered = self.contactsVM.filter(contacts: self.contacts)
        }
    }
    
    var contactsFiltered: [[ContactsModel]] = [[]] {
        didSet {
            DispatchQueue.main.async {
                self.contactsTableView.reloadData()
            }
        }
    }
        
    var selectedContact: ContactsModel! {
        didSet {
            self.performSegue(withIdentifier: Constants.SegueIdentifier.showDetailSegue, sender: nil)
        }
    }
    
    fileprivate func registerTVCell() {
        let nib = UINib(nibName: Constants.CellIdentifier.contactCell, bundle: nil)
        contactsTableView.register(nib, forCellReuseIdentifier: Constants.CellIdentifier.contactCell)
    }
    
    fileprivate func errorBanner(_ error: Error) {
        let banner = NotificationBanner(title: "Error", subtitle: error.localizedDescription, style: .danger)
        DispatchQueue.main.async {
            banner.show()
        }
    }
    
    fileprivate func getContacts() {
        contactsVM.getContacts { [weak self] (res: [ContactsModel]?, error: Error?) in
            if let self = self {
                if let error = error {
                    self.errorBanner(error)
                } else if let contacts = res {
                    self.contacts = contacts
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTVCell()
        getContacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ContactDetailVC {
            vc.contactInfo = self.selectedContact
            vc.updateContactProtocol = self
        }
    }
}

extension ContactsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedContact = contactsFiltered[indexPath.section][indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.contactsFiltered.count
    }
}

extension ContactsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactsFiltered[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.contactCell, for: indexPath) as! ContactCell
        let contact = self.contactsFiltered[indexPath.section][indexPath.row]
        cell.setInfoToView(with: contact)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contactsVM.headerOfSecction[section]
    }
}

extension ContactsVC: UpdateContactProtocol {
    func updateIsFavoriteContact(id: String, isFavorite: Bool) {
        contactsVM.updateInfo(of: &contacts, by: id, with: isFavorite)
    }
}
