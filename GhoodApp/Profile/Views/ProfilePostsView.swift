//
//  ProfilePostsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct ProfilePostsView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<5) { _ in
                    CommunityPost()
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ProfilePostsView()
}
