//
//  CommunityDiscoverView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/23/25.
//

import SwiftUI

struct CommunityDiscoverView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    CapsuleSearchBar()
                        .padding(.bottom,10)
                    VStack {
                        LazyVGrid(columns: [
                            GridItem(.adaptive(minimum:  180), spacing: 10)
                        ], spacing: 15) {
                            CommunityDiscoverTileView(
                                onJoin: { print("Joined") }
                            )
                            CommunityDiscoverTileView(
                                onJoin: { print("Joined") }
                            )
                            CommunityDiscoverTileView(
                                onJoin: { print("Joined") }
                            )
                            CommunityDiscoverTileView(
                                onJoin: { print("Joined") }
                            )
                            CommunityDiscoverTileView(
                                onJoin: { print("Joined") }
                            )
                            CommunityDiscoverTileView(
                                onJoin: { print("Joined") }
                            )
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .foregroundStyle(Color(.systemGray5))
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {dismiss()}, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(Color(ghoodPink))
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Button(action: {dismiss()}, label: {
                            Text("Creator Communities")
                                .foregroundStyle(Color(.black))
                                .fontWeight(.bold)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityDiscoverView()
}
