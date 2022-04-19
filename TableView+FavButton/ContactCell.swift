//
//  ContactCell.swift
//  TableView+FavButton
//
//  Created by Vasichko Anna on 19.04.2022.
//

import UIKit

class ContactCell: UITableViewCell {
    
    var contact: Contact!

    func configure(with contact: Contact, for cellIndex: Int) {
        self.contact = contact
        
        var content = defaultContentConfiguration()
        content.text = contact.fullName
        contentConfiguration = content
        
        let favoriteButton = UIButton(type: .custom)
        favoriteButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        favoriteButton.tintColor = contact.favoriteStatus ? .systemRed : .lightGray
        favoriteButton.tag = cellIndex
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        
        accessoryView = favoriteButton
    }
    
    @objc private func favoriteButtonPressed(_ sender: UIButton) {
        contact.favoriteStatus.toggle()
        DataManager.shared.changeFavoriteStatus(at: sender.tag)
        sender.tintColor = contact.favoriteStatus ? .systemRed : .lightGray
    }
}
