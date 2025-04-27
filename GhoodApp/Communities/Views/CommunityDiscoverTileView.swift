//
//  CommunityDiscoverTileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct CommunityDiscoverTileView: View {
    let onJoin: () -> Void
    
    var body: some View {
        NavigationLink {
            CommunityPageView()
                .navigationBarBackButtonHidden()
            } label: {
                VStack(spacing: 0) {
                    // Top half - Image
                    Image("TinxCoverPhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 120)
                        .clipped()
                    
                    // Bottom half - Content
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Tinx's Army")
                            .font(.headline)
                            .foregroundColor(.black)
                        HStack(spacing: 3) {
                            Text("Private")
                                .font(.system(size: 12))
                                .foregroundStyle(Color(.systemGray))
                            Image(systemName: "circle.fill")
                                .font(.system(size: 2))
                                .foregroundStyle(Color(.systemGray))
                                .padding(.horizontal, 2)
                            Text("19.7k")
                                .font(.system(size: 12))
                                .foregroundStyle(Color(.systemGray))
                            Text("members")
                                .font(.system(size: 12))
                                .foregroundStyle(Color(.systemGray))
                        }
                        Button(action: onJoin) {
                            Text("Join")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                    .background(Color.white)
                }
                .frame(width: 180)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

#Preview {
    CommunityDiscoverTileView(onJoin: { print("Joined!")})
}
