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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                // Make sure the button has a proper hit area
                Button(action: {dismiss()}) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.black)
                        .padding(10) // Add padding to increase tap area
                }
                .contentShape(Rectangle()) // Expand touch area

                Spacer()

                if showHeaderInfo {
                    HStack(spacing: 8) {
                        if let image = coverImage {
                            Image(uiImage: image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 24, height: 24)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        Text(groupName)
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    .transition(.opacity)
                }

                Spacer()

                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.black)
                        .padding(10) // Add padding for consistency
                }
                .contentShape(Rectangle()) // Expand touch area
            }
            .padding(.horizontal)
            .frame(height: 44)
            .padding(.top, topInset)
            // Add semi-transparent background always to ensure button interaction works
            .background(showHeaderInfo ? Color.white : Color.white.opacity(0.01))
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

