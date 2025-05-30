//
//  FeedFilter.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

enum FeedFilterOption: String, CaseIterable, Equatable {
    case sortFollowing = "Following"
    case sortDiscover = "Discover"
}

struct FeedFilter: View {
    @Binding var selected: FeedFilterOption
    
    let ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    var body: some View {
        HStack(spacing: 5) {
            ForEach(FeedFilterOption.allCases, id: \.self) { option in
                Button(action: {
                    selected = option
                }) {
                    Text(option.rawValue)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(selected == option ? .white : Color.gray)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(selected == option ? .blue.opacity(0.7) : Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(.gray, lineWidth: 0.6)
                                )
                        )
                }
            }
        }
        .padding(.horizontal)
    }
}

// Preview
struct FeedFilter_Previews: PreviewProvider {
    static var previews: some View {
        FeedFilter(selected: .constant(.sortFollowing))
    }
}
