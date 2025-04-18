//
//  JoinButton.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct JoinButton: View {
    @State private var isJoined = false
    private let ghoodPink = Color(red: 255/255, green: 41/255, blue: 91/255)

    var body: some View {
        Button(action: {
            isJoined.toggle()
        }) {
            Text(isJoined ? "Joined" : "Join")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(isJoined ? ghoodPink : .white)
                .padding(.vertical, 6)
                .padding(.horizontal, 16)
                .background(
                    Capsule()
                        .fill(isJoined ? Color.white : ghoodPink)
                        .overlay(
                            Capsule().stroke(ghoodPink, lineWidth: 1)
                        )
                )
        }
        .animation(.easeInOut(duration: 0.2), value: isJoined)
    }
}

#Preview {
    JoinButton()
}
