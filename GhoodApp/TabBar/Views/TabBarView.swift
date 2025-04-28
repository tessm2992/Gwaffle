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
                
                CommunityListView(selectedTab: $selectedTab)
                    .tabItem {
                        Image(systemName: "person.3")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                    }
                    .tag(1)
                
                CreateThreadPostView()
                    .tabItem {
                        Image(systemName: "plus.rectangle.fill")
                    }
                
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
            .tint(Color(hex: "#FF295B"))
        }
    }
}
    

#Preview {
    TabBarView()
}
