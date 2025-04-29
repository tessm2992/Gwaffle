//
//  CommunityAvatarsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/28/25.
//

import SwiftUI

struct CommunityAvatarsView: View {
    let size: CGFloat = 60
    let borderWidth: CGFloat = 2
    let overlapAmount: CGFloat = 35
    
    // Using your avatar image names
    let avatarImages = [
        "avatar",
        "avatar2",
        "avatar3",
        "avatar",
        "avatar2",
        "avatar3"
    ]
    
    var body: some View {
        HStack(spacing: 0) {
            ZStack(alignment: .leading) {
                // Display 6 avatars
                ForEach(0..<6) { index in
                    Image(avatarImages[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: borderWidth)
                        )
                        .offset(x: CGFloat(index) * (size - overlapAmount))
                        .zIndex(Double(6 - index))
                }
                
                // Add the ellipsis at the end
                ZStack {
                    Circle()
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 30, height: 30)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: borderWidth)
                        )
                    
                    HStack(spacing: 4) {
                        ForEach(0..<3, id: \.self) { _ in
                            Circle()
                                .fill(Color.white)
                                .frame(width: 4, height: 4)
                        }
                    }
                }
                .offset(x: 6 * (size - overlapAmount))
                .zIndex(0)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 16)
    }
}

#Preview {
    CommunityAvatarsView()
}
