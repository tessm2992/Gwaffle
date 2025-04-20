//
//  Threads.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import Foundation

struct PostThread: Identifiable, Hashable, Codable {
    
    let id: String
    let userId: String
    var postThread: String
    var postTitle: String
    var postSubTitle: String?
    var postLikes: Int
    var postURL: String?
    var isVideo: Bool
    var owner: User?
}
