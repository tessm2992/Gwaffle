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

    var body: some View {
        HStack(spacing: 10) {
            ForEach(FeedFilterOption.allCases, id: \.self) { option in
                Button(action: {
                    selected = option
                }) {
                    Text(option.rawValue)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(selected == option ? .white : Color.pink)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(selected == option ? Color.pink : Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.pink, lineWidth: 1)
                                )
                        )
                }
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    @Previewable @State var selected: FeedFilterOption = .sortFollowing
    return FeedFilter(selected: $selected)
}
