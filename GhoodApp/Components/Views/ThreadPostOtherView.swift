//
//  ThreadPostOtherView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct ThreadPostOtherView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        NavigationLink {
            DetailedThreadView()
                .navigationBarBackButtonHidden()
        } label: {
            VStack(alignment: .leading, spacing: 4) {
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
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                BadgeTag(badge: .paige)
                    .padding(.horizontal)
                    .padding(.bottom, 0)
                Text("I'm elaborating on the head of this post. So I'm asking everyone else for advice. You know what I mean? Or no?")
                    .font(.system(size: 12))
                    .foregroundStyle(Color(.black))
                    .padding(.horizontal)
                    .padding(.top, 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
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
                .padding(.horizontal)
                .font(.system(size: 13))
            }
        }
    }
}
#Preview {
    ThreadPostOtherView()
}
