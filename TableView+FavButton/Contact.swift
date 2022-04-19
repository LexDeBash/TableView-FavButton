//
//  Contact.swift
//  TableView+FavButton
//
//  Created by Vasichko Anna on 19.04.2022.
//

import Foundation

struct Contact: Codable {
    let name: String
    let lastName: String
    var favoriteStatus: Bool
    
    var fullName: String {
        "\(name) \(lastName)"
    }
}
