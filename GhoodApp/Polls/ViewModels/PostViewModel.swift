//
//  PostViewModel.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import Foundation
import SwiftUI

// First, let's modify the PostViewModel to include all required methods
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var polls: [Poll] = []
    @Published var selectedOptions: [UUID: Set<UUID>] = [:] // Poll ID: Set of selected option IDs
    
    // Get a poll by ID
    func getPoll(for id: UUID) -> Poll? {
        return polls.first(where: { $0.id == id })
    }
    
    // Method to check if an option is selected
    func isOptionSelected(poll: Poll, option: PollOption) -> Bool {
        return selectedOptions[poll.id]?.contains(option.id) ?? false
    }
    
    // Method to get total votes for a poll
    func getTotalVotes(for poll: Poll) -> Int {
        return poll.options.reduce(0) { $0 + $1.votes }
    }
    
    // Method to toggle a vote for an option
    func toggleVote(for option: PollOption, in poll: Poll) {
        guard let pollIndex = polls.firstIndex(where: { $0.id == poll.id }),
              let optionIndex = polls[pollIndex].options.firstIndex(where: { $0.id == option.id }) else {
            return
        }
        
        // Initialize selected options set for this poll if needed
        if selectedOptions[poll.id] == nil {
            selectedOptions[poll.id] = []
        }
        
        // Check if already selected
        let isSelected = selectedOptions[poll.id]?.contains(option.id) ?? false
        
        if isSelected {
            // Remove vote
            selectedOptions[poll.id]?.remove(option.id)
            polls[pollIndex].options[optionIndex].votes -= 1
        } else {
            // Add vote
            if !poll.allowMultipleVotes {
                // For single-vote polls, clear previous selections
                if let selectedOptionIds = selectedOptions[poll.id] {
                    for selectedId in selectedOptionIds {
                        if let index = polls[pollIndex].options.firstIndex(where: { $0.id == selectedId }) {
                            polls[pollIndex].options[index].votes -= 1
                        }
                    }
                }
                selectedOptions[poll.id] = []
            }
            
            selectedOptions[poll.id]?.insert(option.id)
            polls[pollIndex].options[optionIndex].votes += 1
        }
        
        // Trigger UI update
        objectWillChange.send()
    }
    
    // Poll creation method
    func createPoll(question: String, options: [String], allowMultipleVotes: Bool) -> UUID {
        let pollOptions = options.map { PollOption(text: $0) }
        let poll = Poll(question: question, options: pollOptions, allowMultipleVotes: allowMultipleVotes)
        polls.append(poll)
        return poll.id
    }
    
    // Post creation method
    func createPost(text: String, pollId: UUID?) {
        let post = Post(text: text, pollId: pollId)
        posts.append(post)
        objectWillChange.send()
    }
}
