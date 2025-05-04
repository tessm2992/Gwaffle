//
//  CreateCommunityPostTile.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CreateCommunityPostTile: View {
    @State private var showCreatePost: Bool = false
    
    var body: some View {
        HStack {
            Image("avatar")
                .resizable()
                .scaledToFill()
                .frame(width: 40,height: 40)
                .clipShape(Circle())
            Button(action: {
                showCreatePost.toggle()
            }, label: {
                HStack {
                    Text("Write something...")
                        .foregroundColor(Color(.systemGray))
                    Spacer()
                }
            })
            Spacer()
            Image(systemName:"photo.badge.plus")
                .resizable()
                .scaledToFill()
                .frame(width: 20,height: 20)
                .foregroundStyle(Color(.systemGray3))
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $showCreatePost, content: {
            CreateCommunityPostView()
        })
    }
}

#Preview {
    CreateCommunityPostTile()
}
