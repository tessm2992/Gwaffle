//
//  TabBarView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    init() {
        // Use UIKit's appearance API to customize tab bar
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        // Apply to both standard and scrolling edge appearances
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    }
                    .tag(0)
                
                PollsView(viewModel: {
                    let viewModel = PostViewModel()
                    // Add sample polls with some votes
                    let poll1 = Poll(
                        question: "What's your favorite season?",
                        options: [
                            PollOption(text: "Spring", votes: 12),
                            PollOption(text: "Summer", votes: 28),
                            PollOption(text: "Fall", votes: 15),
                            PollOption(text: "Winter", votes: 8)
                        ],
                        allowMultipleVotes: false
                    )
                    let poll2 = Poll(
                        question: "Which social media platforms do you use?",
                        options: [
                            PollOption(text: "Instagram", votes: 42),
                            PollOption(text: "Twitter", votes: 35),
                            PollOption(text: "Facebook", votes: 20),
                            PollOption(text: "TikTok", votes: 38)
                        ],
                        allowMultipleVotes: true
                    )
                    viewModel.polls = [poll1, poll2]
                    return viewModel
                }())
                    .tabItem {
                        Image(systemName: "chart.bar")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                    }
                    .tag(1)
                
                CommunityListView(selectedTab: $selectedTab)
                    .tabItem {
                        Image(systemName: "person.3")
                            .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                    }
                    .tag(2)
                
                InboxMainView()
                    .tabItem {
                        Image(systemName: "bell")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                    }
                    .tag(3)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                    }
                    .tag(4)
            }
            .tint(Color(.black))
        }
    }
}
    

#Preview {
    TabBarView()
}
