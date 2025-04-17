//
//  HomeLogo.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct HomeLogo: View {
    @Binding var selectedTab: Int

    var body: some View {
        Button(action: {
            selectedTab = 0
        }) {
            Image("ghoodlogo")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 40)
                .clipped()
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0

        var body: some View {
            HomeLogo(selectedTab: $selectedTab)
        }
    }

    return PreviewWrapper()
}

