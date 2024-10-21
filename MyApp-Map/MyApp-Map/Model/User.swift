//
//  User.swift
//  MyApp-Map
//
//  Created by 임채성 on 2024/10/07.
//

import Foundation

struct User: Codable {
    var userEmail: String
    var userName: String
    var profileImageURL: URL? = nil
}
