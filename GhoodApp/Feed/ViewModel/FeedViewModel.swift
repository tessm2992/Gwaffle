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
        .init(id: "3", userId: "2", threadId: "1", postTitle: "Did anyone hear how sydney sweeney want to glen powell's sister's wedding?", postSubTitle: "there are pictures of them dancing. looks like they might be dating.", postLikes: 15, postURL: "sydneyglen", isVideo: false)
    ]
    
    @Published var threadpage: [PageThread] = [
        .init(id: "0", pageTitle: "g/summerhousebravo", pageAdmins: "0", pageFollowers: 234, pageURL: "threadpic", pageAbout: "Welcome to g/summerhousebravo where we discuss all things Summer House, Winter House, and Martha's Vineyard on Bravo!", pageCategory: "Pop Culture"),
        .init(id: "1", pageTitle: "g/popculture", pageAdmins: "0", pageFollowers: 400, pageURL: "popculture", pageAbout: "Welcome to g/summerhousebravo where we discuss all things Summer House, Winter House, and Martha's Vineyard on Bravo!", pageCategory: "Pop Culture")
    ]
    
    init() {
          setupThreadPosts()
      }

      private func setupThreadPosts() {
          for index in 0..<threadposts.count {
              threadposts[index].owner = users.first(where: { $0.id == threadposts[index].userId })
              
              threadposts[index].page = threadpage.first(where: { $0.id == threadposts[index].threadId })
          }
      }
}

