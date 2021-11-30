//
//  ContactDetailVC.swift
//  Contacts
//
//  Created by Camilo Jimenez on 25/11/21.
//

import UIKit

class ContactDetailVC: UIViewController {
    @IBOutlet weak var detailInfoTableView: UITableView!
    @IBOutlet weak var contactPicture: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactCompanyName: UILabel!
    @IBOutlet weak var isFavoriteButton: UIBarButtonItem!
    
    let contactDetailVM = ContactDetailVM()
    var contactInfo: ContactsModel!
    var detailInfoInSecctions: [DetailSecctions]!
    
    fileprivate func registerTVCell() {
        let nib = UINib(nibName: Constants.CellIdentifier.infoDetailCell, bundle: nil)
        detailInfoTableView.register(nib, forCellReuseIdentifier: Constants.CellIdentifier.infoDetailCell)
    }
    
    @IBAction func isFavoriteAction(_ sender: Any) {
        
    }
    fileprivate func setupView() {
        if let largeImageURL = contactInfo.largeImageURL {
            contactPicture.download(from: largeImageURL)
        }
        contactName.text = contactInfo.name
        contactCompanyName.text = contactInfo.companyName
        
        if let isFavorite = contactInfo.isFavorite {
            isFavoriteButton.image = isFavorite ? UIImage(named: "StarFill") : UIImage(named: "StarNotFill")
        } else {
            isFavoriteButton.customView?.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerTVCell()
        detailInfoInSecctions = contactDetailVM.convertDataInSecctions(contact: contactInfo)
        setupView()
    }
}

extension ContactDetailVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return detailInfoInSecctions.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.infoDetailCell, for: indexPath) as! InfoDetailCell
        cell.setInfoToView(with: detailInfoInSecctions[indexPath.section])
        return cell
    }
}

extension ContactDetailVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
