//
//  PollViewModel.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import Foundation
import SwiftUI

@MainActor
class PollViewModel: ObservableObject {
    @Published var polls: [Poll] = []
    @Published var userVotes: [UUID: Set<UUID>] = [:] // pollId: Set of voted option IDs
    
    func createPoll(question: String, options: [String], allowMultipleVotes: Bool) {
        let pollOptions = options.map { PollOption(text: $0) }
        let newPoll = Poll(question: question, options: pollOptions, allowMultipleVotes: allowMultipleVotes)
        polls.append(newPoll)
    }
    
    func addOption(to pollId: UUID, optionText: String) {
        guard let index = polls.firstIndex(where: { $0.id == pollId }) else { return }
        let newOption = PollOption(text: optionText)
        polls[index].options.append(newOption)
    }
    
    func vote(on pollId: UUID, optionId: UUID) {
        guard let pollIndex = polls.firstIndex(where: { $0.id == pollId }),
              let optionIndex = polls[pollIndex].options.firstIndex(where: { $0.id == optionId }) else { return }
        
        let poll = polls[pollIndex]
        var userVotesForPoll = userVotes[pollId] ?? Set<UUID>()
        
        if poll.allowMultipleVotes {
            // Toggle vote for multiple choice polls
            if userVotesForPoll.contains(optionId) {
                userVotesForPoll.remove(optionId)
                polls[pollIndex].options[optionIndex].votes -= 1
            } else {
                userVotesForPoll.insert(optionId)
                polls[pollIndex].options[optionIndex].votes += 1
            }
        } else {
            // Single choice poll - remove previous vote if exists
            if let previousVote = userVotesForPoll.first,
               let previousIndex = polls[pollIndex].options.firstIndex(where: { $0.id == previousVote }) {
                polls[pollIndex].options[previousIndex].votes -= 1
                userVotesForPoll.remove(previousVote)
            }
            
            // Add new vote
            userVotesForPoll.insert(optionId)
            polls[pollIndex].options[optionIndex].votes += 1
        }
        
        userVotes[pollId] = userVotesForPoll
    }
    
    func hasVoted(on pollId: UUID, optionId: UUID) -> Bool {
        return userVotes[pollId]?.contains(optionId) ?? false
    }
} 