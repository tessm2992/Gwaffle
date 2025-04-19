//
//  DetailedThreadView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct DetailedThreadView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @Environment(\.dismiss) private var dismiss
    @State private var isLiked = false  
    @State private var likeCount = 18
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        NavigationLink {
                            ProfileView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                        }
                        NavigationLink {
                            ProfileView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("tessm234")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundStyle(ghoodPink.opacity(0.7))
                        }
                        Text("12h")
                            .font(.system(size: 13))
                            .foregroundStyle(Color(.systemGray))
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical,2)
                    Text("Placeholder header text for the posts. This is going to be in bold")
                        .font(.system(size: 14,weight: .semibold))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.bottom, 0)
                    BadgeTag(badge: .paige)
                        .padding(.horizontal)
                        .padding(.bottom, 0)
                    Text("I'm elaborating on the head of this post. So I'm asking everyone else for advice. You know what I mean? Or no?")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.top, 0)
                    Image("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .clipped()
                    HStack(spacing: 4) {
                        Image(systemName: "hand.thumbsup.circle.fill")
                            .resizable()
                            .frame(width: 18,height: 18)
                            .foregroundStyle(Color(ghoodPink))
                        Text("18")
                            .foregroundStyle(Color(ghoodPink))
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 18,height: 18)
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                        Text("43")
                            .foregroundStyle(Color(ghoodPink))
                    }
                    .padding(.horizontal)
                    .font(.system(size: 13))
                    CommentView(
                        username: "tessm234",
                        timeAgo: "2h ago",
                        commentText: "This is such a helpful post! Thanks for sharing your thoughts.",
                        isLiked: $isLiked,
                        likeCount: $likeCount
                    )
                    .padding(.top)
                }
            }
            .scrollIndicators(.hidden)
            .foregroundStyle(Color(.systemGray5))
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Text("g/summerhousebravo")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
            }
        }
    }
}

#Preview {
    DetailedThreadView()
}
