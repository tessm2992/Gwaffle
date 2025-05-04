//
//  Post.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import Foundation

struct Post: Identifiable {
    let id: UUID
    let text: String
    let pollId: UUID?
    
    init(id: UUID = UUID(), text: String, pollId: UUID? = nil) {
        self.id = id
        self.text = text
        self.pollId = pollId
    }
}
