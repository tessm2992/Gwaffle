//
//  MembersMainView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct MembersMainView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    @State private var selectedTab = 0
    
    @Environment(\.dismiss) private var dismiss
    private let tabTitles = ["MEMBERS", "REQUESTS"]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
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
                                    .foregroundColor(selectedTab == index ? .black : .gray)
                                    .padding(.vertical, 10)
                                    .frame(maxWidth: .infinity)
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 2)
                                            .foregroundColor(selectedTab == index ? ghoodPink : .clear),
                                        alignment: .bottom
                                    )
                            }
                        }
                    }
                    .padding(.top, 0)
                    
                    // Swipeable Pages
                    TabView(selection: $selectedTab) {
                        MembersListView()
                            .tag(0)
                        
                        MembersRequestView()
                            .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {dismiss()}, label: {
                            Image(systemName: "chevron.left")
                                .foregroundStyle(Color(.black))
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Community Members")
                            .foregroundStyle(Color(.black))
                            .font(.system(size: 20,weight: .semibold))
                    }
                }
            }
        }
    }
}

#Preview {
    MembersMainView()
}
