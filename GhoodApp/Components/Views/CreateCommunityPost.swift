//
//  CreateCommunityPost.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CreateCommunityPost: View {
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(width: 40,height: 40)
                .clipShape(Circle())
            Text("Write something...")
                .foregroundColor(Color(.systemGray))
            Spacer()
            Image(systemName:"photo.badge.plus")
                .resizable()
                .scaledToFill()
                .frame(width: 20,height: 20)
                .foregroundStyle(.green)
        }
        .padding(.horizontal)
    }
}

#Preview {
    CreateCommunityPost()
}
