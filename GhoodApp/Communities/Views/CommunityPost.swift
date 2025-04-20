//
//  CommunityPost.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CommunityPost: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        NavigationLink {
            DetailedThreadView()
                .navigationBarBackButtonHidden()
        } label: {
            VStack(alignment: .leading,spacing: 6) {
                VStack(alignment: .leading) {
                    HStack {
                        NavigationLink {
                            ProfileView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30,height: 30)
                                .clipShape(Circle())
                        }
                        VStack(alignment: .leading, spacing: 0){
                            NavigationLink {
                                ProfileView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("tessm234")
                                    .font(.system(size: 15,weight: .semibold))
                                    .foregroundStyle(ghoodPink.opacity(0.7))
                            }
                            Text("2h")
                                .font(.system(size: 11))
                                .foregroundStyle(Color(.systemGray))
                                .padding(.top, 2)
                        }
                    }
                    Text("I'm elaborating on the head of this post. So I'm asking everyone else for advice. You know what I mean? Or no?")
                        .font(.system(size: 14))
                        .foregroundStyle(Color(.black))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)
                Image("threadpic")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .clipped()
                HStack(spacing: 3) {
                    Image(systemName: "hand.thumbsup.circle.fill")
                        .resizable()
                        .frame(width: 18,height: 18)
                        .foregroundStyle(Color(ghoodPink))
                    Text("18")
                        .foregroundStyle(Color(ghoodPink))
                    Spacer()
                    Text("43 comments")
                        .foregroundStyle(Color(ghoodPink))
                }
                .font(.system(size: 13))
                .padding(.horizontal)
            }
            .padding(.top,6)
            .padding(.bottom,6)
        }
    }
}

#Preview {
    CommunityPost()
}
