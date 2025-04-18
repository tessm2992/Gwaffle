//
//  FollowButtonView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct FollowButtonView: View {
    @State private var isFollowing = false
    private let ghoodPink = Color(red: 255/255, green: 41/255, blue: 91/255)

    var body: some View {
        Button(action: {
            isFollowing.toggle()
        }) {
            Text(isFollowing ? "Following" : "Follow")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(isFollowing ? ghoodPink : .white)
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .background(
                    Capsule()
                        .fill(isFollowing ? Color.white : ghoodPink)
                        .overlay(
                            Capsule().stroke(ghoodPink, lineWidth: 1)
                        )
                )
        }
        .animation(.easeInOut(duration: 0.2), value: isFollowing)
    }
}


#Preview {
    FollowButtonView()
}
