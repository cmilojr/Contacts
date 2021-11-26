//
//  ContactDetailVC.swift
//  Contacts
//
//  Created by Camilo Jimenez on 25/11/21.
//

import UIKit

class ContactDetailVC: UIViewController {
    @IBOutlet weak var detailInfoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let nib = UINib(nibName: Constants.CellIdentifier.infoDetailCell, bundle: nil)
        detailInfoTableView.register(nib, forCellReuseIdentifier: Constants.CellIdentifier.infoDetailCell)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ContactDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.infoDetailCell, for: indexPath) as! InfoDetailCell
        return cell
    }
    
    
}

extension ContactDetailVC: UITableViewDelegate {
    
}
