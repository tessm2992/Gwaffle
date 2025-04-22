//
//  CommentThread.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/21/25.
//

import Foundation

struct CommentThread: Identifiable, Hashable, Codable {
    
    let id: String
    let postId: String
    let userId: String
    let text: String
    var likes: Int
    var isLiked: Bool = false
    
    var owner: User?
    var page: PageThread?
    var postT: PostThread?
}
