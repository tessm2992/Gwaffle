//
//  FeedViewModel.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import Foundation

class FeedViewModel: ObservableObject {
    
    @Published var users: [User] = [
        .init(id: "0", firstName: "Tess", lastName: "Munsie", userName: "tessm234", email: "tessm2992@gmail.com", profileImageName: "avatar", age: 31, gender: "female", isCurrentUser: true),
        .init(id: "1", firstName: "Annabelle", lastName: "Robbins", userName: "annar203", email: "arobbins@gmail.com", profileImageName: "avatar2", age: 28, gender: "female", isCurrentUser: false),
        .init(id: "2", firstName: "Rachel", lastName: "Simmons", userName: "rachels999", email: "rachels2992@gmail.com", profileImageName: "avatar3", age: 35, gender: "female", isCurrentUser: false)
    ]
    
    @Published var threadposts: [PostThread] = [
        .init(id: "0", userId: "2", threadId: "0", postTitle: "Are Craig and Paige broken up?", postSubTitle: "i heard that they broke up.", postLikes: 2, postURL: "craigpaige", isVideo: false),
        .init(id: "1", userId: "1", threadId: "1", postTitle: "Did anyone hear how sydney sweeney want to glen powell's sister's wedding?", postSubTitle: "there are pictures of them dancing. looks like they might be dating.", postLikes: 15, postURL: "sydneyglen", isVideo: false),
        .init(id: "2", userId: "0", threadId: "0", postTitle: "Paige and her anxiety", postSubTitle: "I've never related more to her. Her anxiety this past episode and then saying, 'oh, and I'm supposed to get my period today.' I felt it to the core. I am so glad she seems to be happy with her decision to leave Craig", postLikes: 45, postURL: "", isVideo: false),
        .init(id: "3", userId: "2", threadId: "2", postTitle: "Microneedling treatments?", postSubTitle: "Anyone ever try microneedling treatments for antiaging? I've been reading about it online and have heard mixed reviews on how effective it is.", postLikes: 56, postURL: "", isVideo: false)
    ]
    
    @Published var threadpage: [PageThread] = [
        .init(id: "0", pageTitle: "g/summerhousebravo", pageAdmins: "0", pageFollowers: 234, pageURL: "threadpic", pageAbout: "Welcome to g/summerhousebravo where we discuss all things Summer House, Winter House, and Martha's Vineyard on Bravo!", pageCategory: "Pop Culture"),
        .init(id: "1", pageTitle: "g/generalpopculture", pageAdmins: "1", pageFollowers: 400, pageURL: "popculture", pageAbout: "Welcome to g/generalpopculture where we discuss all things celebrity and pop culture news!", pageCategory: "Pop Culture"),
        .init(id: "2", pageTitle: "g/skincare", pageAdmins: "2", pageFollowers: 1221, pageURL: "skincare", pageAbout: "Welcome to g/skincare where we discuss all things skincare products, beauty regimes, anti-aging and treatments!", pageCategory: "Beauty & Wellness")
    ]
    
    @Published var threadcomments: [CommentThread] = [
        .init(id: "0", postId: "0", userId: "0", text: "I heard they're definitely broken up. So sad!", likes: 5),
        .init(id: "1", postId: "0", userId: "1", text: "I don't think so. They were seen together last week.", likes: 7),
        .init(id: "2", postId: "1", userId: "2", text: "They look so cute together! I hope they're dating.", likes: 12),
        .init(id: "3", postId: "2", userId: "1", text: "I feel exactly the same way about anxiety. It's so relatable.", likes: 9),
        .init(id: "4", postId: "3", userId: "0", text: "I tried microneedling and loved the results! Highly recommend.", likes: 4)
    ]
    
    init() {
        setupThreadPosts()
        setupThreadComments()
    }

    private func setupThreadPosts() {
        for index in 0..<threadposts.count {
            threadposts[index].owner = users.first(where: { $0.id == threadposts[index].userId })
            threadposts[index].page = threadpage.first(where: { $0.id == threadposts[index].threadId })
        }
    }
    
    private func setupThreadComments() {
        for index in 0..<threadcomments.count {
            threadcomments[index].owner = users.first(where: { $0.id == threadcomments[index].userId })
            threadcomments[index].page = threadpage.first(where: { $0.id == threadcomments[index].userId })
            threadcomments[index].postT = threadposts.first(where: { $0.id == threadcomments[index].userId })
        }
    }
}

