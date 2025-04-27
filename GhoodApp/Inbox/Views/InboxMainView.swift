//
//  InboxMainView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct InboxMainView: View {
    @State private var selectedTab = 0
    private let tabTitles = ["Notifications", "Messages"]

    var body: some View {
        NavigationStack {
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
                                .foregroundColor(selectedTab == index ? .pink : .gray)
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(selectedTab == index ? .pink : .clear),
                                    alignment: .bottom
                                )
                        }
                    }
                }
                .padding(.top, 0)
                
                // Swipeable Pages
                TabView(selection: $selectedTab) {
                    NotificationsView()
                        .tag(0)
                    
                    MessagesView()
                        .tag(1)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("Inbox")
                            .foregroundStyle(Color(ghoodPink))
                            .font(.system(size: 20,weight: .semibold))
                    }
                }
            }
        }
    }
}

#Preview {
    InboxMainView()
}
