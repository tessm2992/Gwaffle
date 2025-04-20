//
//  User.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    var profileImageName: String?
    var age: Int
    let gender: String
    var isCurrentUser: Bool
    
}
