//
//  CommunityTagTile.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/28/25.
//

import SwiftUI

struct CommunityTagTile: View {
    let communityTag: String
    
    var body: some View {
        Text(communityTag)
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.black)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
    }
}

#Preview {
    CommunityTagTile(communityTag: "Creator")
}
