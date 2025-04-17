//
//  ThreadFilter.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

enum ThreadFilterOption: String, CaseIterable, Equatable {
    case sortFollowing = "Following"
    case sortDiscover = "Discover"
}

struct ThreadFilter: View {
    @Binding var selected: ThreadFilterOption

    var body: some View {
        HStack(spacing: 10) {
            ForEach(ThreadFilterOption.allCases, id: \.self) { option in
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
    @Previewable @State var selected: ThreadFilterOption = .sortFollowing
    return ThreadFilter(selected: $selected)
}
