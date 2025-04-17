//
//  TabBarView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
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
            
            Text("Create Post View")
                .tabItem {
                    Image(systemName: "plus.rectangle.fill")
                    Text("Create")
                    }
            
            Text("Inbox View")
                .tabItem {
                    Image(systemName: "bell")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                    Text("Inbox")
                    }
                .tag(3)
            
            Text("Profile View")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                    Text("Profile")
                    }
                .tag(4)
        
                }
        .tint(Color(hex: "#FF295B"))
    }
}

#Preview {
    TabBarView()
}
