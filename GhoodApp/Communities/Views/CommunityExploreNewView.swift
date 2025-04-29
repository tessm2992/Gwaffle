//
//  CommunityExploreNewView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/28/25.
//

import SwiftUI

struct CommunityExploreNewView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    CapsuleSearchBar()
                        .padding(.bottom,10)
                    VStack {
                        CommunityExploreNewTileView(
                            onFollow: { print("Joined") }
                        )
                        CommunityExploreNewTileView(
                            onFollow: { print("Joined") }
                        )
                        CommunityExploreNewTileView(
                            onFollow: { print("Joined") }
                        )
                        CommunityExploreNewTileView(
                            onFollow: { print("Joined") }
                        )
                        CommunityExploreNewTileView(
                            onFollow: { print("Joined") }
                        )
                        CommunityExploreNewTileView(
                            onFollow: { print("Joined") }
                        )
                        }
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
    CommunityExploreNewView()
}
