//
//  Poll.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import Foundation

struct Poll: Identifiable {
    let id: UUID
    let question: String
    var options: [PollOption]
    let allowMultipleVotes: Bool
    
    init(id: UUID = UUID(), question: String, options: [PollOption], allowMultipleVotes: Bool) {
        self.id = id
        self.question = question
        self.options = options
        self.allowMultipleVotes = allowMultipleVotes
    }
}

struct PollOption: Identifiable {
    let id: UUID
    let text: String
    var votes: Int
    
    init(id: UUID = UUID(), text: String, votes: Int = 0) {
        self.id = id
        self.text = text
        self.votes = votes
    }
}
