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
        VStack(alignment: .leading) {
            HStack {
                NavigationLink {
                    ThreadView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                        .clipShape(Circle())
                }
                NavigationLink {
                    ThreadView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("tessm234")
                        .font(.system(size: 11,weight: .semibold))
                        .foregroundStyle(ghoodPink.opacity(0.7))
                }
                Text("2 hours ago")
                    .font(.system(size: 11))
                    .foregroundStyle(Color(.systemGray))
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical,2)
            Text("Placeholder header text for the posts. This is going to be in bold")
                .font(.system(size: 14,weight: .semibold))
                .foregroundStyle(Color(.black))
                .padding(.horizontal)
            BadgeTag(badge: .paige)
                .padding(.horizontal)
            Text("I'm elaborating on the head of this post. So I'm asking everyone else for advice. You know what I mean? Or no?")
                .font(.system(size: 14))
                .foregroundStyle(Color(.black))
                .padding(.horizontal)
                .padding(.top,1)
            Image("threadpic")
                .resizable()
                .scaledToFill()
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
#Preview {
    ThreadPostOtherView()
}
