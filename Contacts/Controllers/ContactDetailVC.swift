//
//  ContactDetailVC.swift
//  Contacts
//
//  Created by Camilo Jimenez on 25/11/21.
//

import UIKit

class ContactDetailVC: UIViewController {
    @IBOutlet weak var detailInfoTableView: UITableView!
    var contactInfo: ContactsModel!
    
    fileprivate func registerTVCell() {
        let nib = UINib(nibName: Constants.CellIdentifier.infoDetailCell, bundle: nil)
        detailInfoTableView.register(nib, forCellReuseIdentifier: Constants.CellIdentifier.infoDetailCell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTVCell()
    }    
}

extension ContactDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.infoDetailCell, for: indexPath) as! InfoDetailCell
        return cell
    }
}

extension ContactDetailVC: UITableViewDelegate {
    
}
