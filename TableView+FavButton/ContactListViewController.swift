//
//  ContactListViewController.swift
//  TableView+FavButton
//
//  Created by Vasichko Anna on 19.04.2022.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContact(_ contact: Contact)
}

protocol ContactCellDelegate {
    func favoriteButtonTapped(for cell: ContactCell)
}

class ContactListViewController: UITableViewController {

    private var  contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = DataManager.shared.fetchContacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! NewContactViewController
        newContactVC.delegate = self
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contact") as! ContactCell
        let contact = contacts[indexPath.row]
    
        cell.configure(with: contact)
        cell.delegate = self
        
        cell.accessoryView?.tintColor = contact.favoriteStatus ? .systemRed : .lightGray
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        changeFavoriteStatus(at: indexPath)
    }
    
    private func changeFavoriteStatus(at indexPath: IndexPath) {
        contacts[indexPath.row].favoriteStatus.toggle()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

// MARK: - NewContactViewControllerDelegate
extension ContactListViewController: NewContactViewControllerDelegate {
    func saveContact(_ contact: Contact) {
        contacts.append(contact)
        tableView.reloadData()
    }
}

// MARK: - ContactCellDelegate
extension ContactListViewController: ContactCellDelegate {
    func favoriteButtonTapped(for cell: ContactCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        changeFavoriteStatus(at: indexPath)
    }
}
