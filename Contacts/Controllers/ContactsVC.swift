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
    var contacts: [ContactsModel] = []
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
                    DispatchQueue.main.async {
                        self.contactsTableView.reloadData()
                    }
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
        }
    }
}

extension ContactsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedContact = contacts[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ContactsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContactCell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.contactCell, for: indexPath) as! ContactCell
        cell.setInfoToView(with: self.contacts[indexPath.row])

        return cell
    }
}
