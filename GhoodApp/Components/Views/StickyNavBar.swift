//
//  StickyNavBar.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct StickyNavBar: View {
    let coverImage: UIImage?
    let groupName: String
    let topInset: CGFloat
    let showHeaderInfo: Bool
    let ghoodPink: Color

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(showHeaderInfo ? ghoodPink : ghoodPink)
                }

                Spacer()

                if showHeaderInfo {
                    HStack(spacing: 8) {
                        if let image = coverImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 24, height: 24)
                                .clipShape(Circle())
                        }
                        Text(groupName)
                            .font(.headline)
                            .foregroundColor(ghoodPink)
                    }
                    .transition(.opacity)
                }

                Spacer()

                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(showHeaderInfo ? ghoodPink : ghoodPink)
                }
            }
            .padding(.horizontal)
            .frame(height: 44)
            .padding(.top, topInset)
            .background(showHeaderInfo ? Color.white : Color.clear)
            .shadow(color: showHeaderInfo ? Color.black.opacity(0.1) : Color.clear, radius: 4, y: 2)
        }
    }
}


#Preview {
    StickyNavBar(
        coverImage: UIImage(named: "TinxCoverPhoto"),
        groupName: "Tinx's Army",
        topInset: 44,
        showHeaderInfo: true,
        ghoodPink: Color(red: 255/255, green: 41/255, blue: 91/255)
    )
}

