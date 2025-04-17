//
//  ThreadPostView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct ThreadPostView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Image("threadpic")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40,height: 40)
                        .clipShape(Circle())
                    VStack(alignment: .leading,spacing: 0) {
                        Text("g/summerhousebravo")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundStyle(Color(ghoodPink))
                        Text("2 hours ago")
                            .font(.system(size: 11))
                            .foregroundStyle(Color(.systemGray))
                    }
                    Spacer()
                }
                .padding(.horizontal)
                Text("Placeholder header text for the posts. This is going to be in bold")
                    .padding(.horizontal)
                    .font(.system(size: 14,weight: .semibold))
                Text("I'm elaborating on the head of this post. So I'm asking everyone else for advice. You know what I mean? Or no?")
                    .padding(.horizontal)
                    .padding(.top,1)
                    .font(.system(size: 14))
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
                    Spacer()
                    Text("43 comments")
                        .foregroundStyle(Color(ghoodPink))
                }
                .padding(.horizontal)
                .font(.system(size: 13))
                GeometryReader { proxy in
                    DividerView(width: proxy.size.width - 15)
                }
            }
        }
    }
}

#Preview {
    ThreadPostView()
}

