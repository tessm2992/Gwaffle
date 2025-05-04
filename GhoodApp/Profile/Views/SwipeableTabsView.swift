//
//  SwipeableTabsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct SwipeableTabsView: View {
    @State private var selectedTab = 0
    private let tabTitles = ["POSTS", "COMMENTS"]

    
    var body: some View {
        VStack(spacing: 0) {
            // Tab Headers
            HStack {
                ForEach(0..<tabTitles.count, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            selectedTab = index
                        }
                    }) {
                        Text(tabTitles[index])
                            .fontWeight(selectedTab == index ? .bold : .regular)
                            .foregroundColor(selectedTab == index ? .black.opacity(0.7) : .gray)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(selectedTab == index ? .pink : .clear),
                                alignment: .bottom
                            )
                    }
                }
            }

            // Swipeable Pages
            TabView(selection: $selectedTab) {
                ProfilePostsView()
                    .tag(0)

                ProfileCommentsView()
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 600)
        }
    }
}

#Preview {
    SwipeableTabsView()
}
