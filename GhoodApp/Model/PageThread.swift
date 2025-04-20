//
//  ThreadPage.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import Foundation

struct PageThread: Identifiable, Hashable, Codable {
    
    let id: String
    var pageTitle: String
    var pageAdmins: String
    var pageFollowers: Int
    var pageURL: String?
    var pageAbout: String
    var pageCategory: String

}
