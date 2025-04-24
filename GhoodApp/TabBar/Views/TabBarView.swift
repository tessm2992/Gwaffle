//
//  TabBarView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    @State private var showCreatePostView = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                FeedView()
                    .tabItem {
                        Image(systemName: "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                    .tag(0)
                
                CommunityListView(selectedTab: $selectedTab)
                    .tabItem {
                        Image(systemName: "person.3")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Communities")
                    }
                    .tag(1)
                
                CreateThreadPostView()
                    .tabItem {
                        Image(systemName: "plus.rectangle.fill")
                        Text("Create")
                    }
                
                InboxMainView()
                    .tabItem {
                        Image(systemName: "bell")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Inbox")
                    }
                    .tag(3)
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Profile")
                    }
                    .tag(4)
                
            }
            .tint(Color(hex: "#FF295B"))
        }
        .sheet(isPresented: $showCreatePostView) {
            CreateThreadPostView()
        }
    }
}
    

#Preview {
    TabBarView()
}
