//
//  CommunityExploreView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/28/25.
//

import SwiftUI

struct CommunityExploreView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    CapsuleSearchBar()
                        .padding(.bottom,10)
                    VStack(alignment: .leading) {
                        Text("COMMUNITIES FOR...")
                            .font(.system(size: 15,weight: .semibold))
                            .foregroundStyle(Color(.systemGray))
                        HStack {
                            CommunityTagTile(communityTag: "Creator Community")
                            CommunityTagTile(communityTag: "Local")
                            CommunityTagTile(communityTag: "Social")
                        }
                        HStack {
                            CommunityTagTile(communityTag: "Interests")
                            CommunityTagTile(communityTag: "Support")
                            CommunityTagTile(communityTag: "Professional")
                            CommunityTagTile(communityTag: "Activism")
                        }
                        .padding(.bottom, 15)
                        ForEach(0 ..< 6) { index in
                            NavigationLink {
                                CommunityExploreTileView(
                                    onFollow: { print("Joined") }
                                )
                            } label: {
                                CommunityExploreTileView(
                                    onFollow: { print("Joined") }
                                )
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .scrollIndicators(.hidden)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color(.black))
                    })
                }
                ToolbarItem(placement: .principal) {
                    Button(action: {dismiss()}, label: {
                        Text("Explore Communities")
                            .foregroundStyle(Color(.black))
                            .fontWeight(.bold)
                    })
                }
            }
        }
    }
}

#Preview {
    CommunityExploreView()
}
