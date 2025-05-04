//
//  InboxMainView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct InboxMainView: View {
    @State private var selectedTab = 0
    
    let ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    private let tabTitles = ["NOTIFICATIONS", "MESSAGES"]

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
                                .fontWeight(selectedTab == index ? .semibold : .regular)
                                .foregroundColor(selectedTab == index ? .black.opacity(0.7) : Color(.systemGray2))
                                .padding(.vertical, 10)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(selectedTab == index ? ghoodPink : .clear),
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
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text("Inbox")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundStyle(Color(.black))
                            .padding(.bottom,10)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    InboxMainView()
}
