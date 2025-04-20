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
    let threadId: String
    var postTitle: String
    var postSubTitle: String?
    var postLikes: Int
    var postURL: String?
    var isVideo: Bool
    var owner: User?
    var page: PageThread?
    
}
