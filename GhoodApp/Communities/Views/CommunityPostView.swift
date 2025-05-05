//
//  CommunityPostView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CommunityPostView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    // Optional image name — pass nil if no image
    var optionalImageName: String? = nil

    var body: some View {
        NavigationLink {
            DetailedCommunityView()
                .navigationBarBackButtonHidden()
        } label: {
            VStack(alignment: .leading, spacing: 11) {
                VStack(alignment: .leading) {
                    HStack {
                        NavigationLink {
                            ProfileVisitorView(showBackButton: true, showNickname: true)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                        }
                        VStack(alignment: .leading, spacing: 0) {
                            NavigationLink {
                                ProfileVisitorView(showBackButton: true, showNickname: true)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Tess M")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(Color(.black))
                            }
                            Text("2h")
                                .font(.system(size: 11))
                                .foregroundStyle(Color(.systemGray))
                                .padding(.top, 2)
                        }
                    }
                    Text("I'm elaborating on the head of this post. So I'm asking everyone else for advice. You know what I mean? Or no?")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(.black))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                }
                .padding(.horizontal)

                // Only show the image if it exists
                if let imageName = optionalImageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .clipped()
                }

                HStack(spacing: 3) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20, height: 17)
                        .foregroundStyle(ghoodPink)
                    Text("18")
                        .foregroundStyle(Color(.black.opacity(0.7)))
                    Spacer()
                    Text("43 comments")
                        .foregroundStyle(Color(.black.opacity(0.7)))
                }
                .font(.system(size: 14))
                .padding(.horizontal)
            }
            .padding(.vertical, 15)
        }
    }
}

#Preview {
    CommunityPostView()
}
