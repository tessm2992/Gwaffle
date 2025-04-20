//
//  FeedViewModel.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var users: [User] = [
        .init(id: "0", firstName: "Tess", lastName: "Munsie", email: "tessm2992@gmail.com", profileImageName: "avatar", age: 31, gender: "female", isCurrentUser: true),
        .init(id: "1", firstName: "Annabelle", lastName: "Robbins", email: "arobbins@gmail.com", profileImageName: "avatar2", age: 28, gender: "female", isCurrentUser: false),
        .init(id: "2", firstName: "Rachel", lastName: "Simmons", email: "rachels2992@gmail.com", profileImageName: "avatar3", age: 35, gender: "female", isCurrentUser: false)
    ]
    
    
    @Published var threadposts: [PostThread] = [
        .init(id: "0", userId: "2", postThread: "g/summerhousebravo", postTitle: "Are Craig and Paige broken up?", postSubTitle: "i heard that they broke up.", postLikes: 2, postURL: "craigpaige", isVideo: false),
        .init(id: "1", userId: "2", postThread: "g/popculture", postTitle: "Did anyone hear how sydney sweeney want to glen powell's sister's wedding?", postSubTitle: "there are pictures of them dancing. looks like they might be dating.", postLikes: 15, postURL: "sydneyglen", isVideo: false),
        .init(id: "2", userId: "2", postThread: "g/popculture", postTitle: "Did anyone hear how sydney sweeney want to glen powell's sister's wedding?", postSubTitle: "there are pictures of them dancing. looks like they might be dating.", postLikes: 15, postURL: "sydneyglen", isVideo: false),
        .init(id: "3", userId: "2", postThread: "g/popculture", postTitle: "Did anyone hear how sydney sweeney want to glen powell's sister's wedding?", postSubTitle: "there are pictures of them dancing. looks like they might be dating.", postLikes: 15, postURL: "sydneyglen", isVideo: false)
    ]
    
    init() {
        setupPosts()
    }
    
    private func setupPosts() {
        for index in 0 ..< threadposts.count {
            threadposts[index].owner = users.first(where: {$0.id == threadposts[index].userId})
        }
    }
}
