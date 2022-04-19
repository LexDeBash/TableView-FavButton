//
//  ContactCell.swift
//  TableView+FavButton
//
//  Created by Vasichko Anna on 19.04.2022.
//

import UIKit

class ContactCell: UITableViewCell {
    
    var delegate: ContactCellDelegate!

    func configure(with contact: Contact) {
        var content = defaultContentConfiguration()
        content.text = contact.fullName
        contentConfiguration = content
        
        
        let favoriteButton = UIButton(type: .custom)
        favoriteButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        
        accessoryView = favoriteButton
    }
    
    @objc  private func favoriteButtonPressed() {
        delegate.favoriteButtonTapped(for: self)
    }

}
