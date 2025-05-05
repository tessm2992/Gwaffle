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
            VStack(spacing: 0) {
                ForEach(0..<5) { _ in
                    CommunityPostView()
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ProfilePostsView()

}
