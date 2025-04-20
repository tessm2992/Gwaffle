//
//  CommentCell.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct CommentCell: View {
    let ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    let username: String
    let timeAgo: String
    let commentText: String
    
    @Binding var isLiked: Bool
    @Binding var likeCount: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top, spacing: 8) {
                NavigationLink {
                    ProfileView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading) {
                    VStack(alignment: .leading,spacing: 4) {
                        NavigationLink {
                            ProfileView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text(username)
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundStyle(ghoodPink.opacity(0.7))
                        }
                        Text(commentText)
                            .font(.system(size: 12))
                            .foregroundStyle(Color(.black))
                            .padding(.top, 0)
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(.systemGray6))
                    )
                    HStack(spacing: 9) {
                        Text("\(timeAgo)")
                            .font(.system(size: 11))
                            .foregroundStyle(Color(.systemGray))
                            .padding(.top, 2)
                        Button(action: {
                            isLiked.toggle()
                            likeCount += isLiked ? 1 : -1
                        }) {
                            Text("Like")
                                .font(.system(size: 11,weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                                .padding(.top, 2)
                        }
                        Text("Reply")
                            .font(.system(size: 11,weight: .semibold))
                            .foregroundStyle(Color(.systemGray))
                            .padding(.top, 2)
                        Spacer()
                        HStack(spacing: 3) {
                            Text("\(likeCount)")
                                .font(.system(size: 11))
                                .foregroundStyle(Color(ghoodPink))
                            Image(systemName: "hand.thumbsup.circle.fill")
                                .resizable()
                                .frame(width: 18,height: 18)
                                .foregroundStyle(Color(ghoodPink))
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentCell(
        username: "tessm234",
        timeAgo: "2h",
        commentText: "This is such a helpful post! Thanks for sharing your thoughts.",
        isLiked: .constant(false),
        likeCount: .constant(18)
    )
}

