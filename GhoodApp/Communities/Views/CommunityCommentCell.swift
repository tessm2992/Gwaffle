//
//  CommunityCommentCell.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/22/25.
//

import SwiftUI

struct CommunityCommentCell: View {
    let ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top, spacing: 8) {
                NavigationLink {
                    ProfileView(showBackButton: true)
                        .navigationBarBackButtonHidden()
                } label: {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 35,height: 35)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading) {
                    VStack(alignment: .leading,spacing: 4) {
                        NavigationLink {
                            ProfileView(showBackButton: true)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("tessm345")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundStyle(ghoodPink.opacity(0.7))
                        }
                        Text("This is the text for a coment. It can vary in size depending on how long the comment is.")
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
                        Text("2h")
                            .font(.system(size: 11))
                            .foregroundStyle(Color(.systemGray))
                            .padding(.top, 2)
                        Button(action: {},
                               label: {
                            Text("Like")
                                .font(.system(size: 11,weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                                .padding(.top, 2)
                        })
                        Text("Reply")
                            .font(.system(size: 11,weight: .semibold))
                            .foregroundStyle(Color(.systemGray))
                            .padding(.top, 2)
                        Spacer()
                        HStack(spacing: 3) {
                            Text("3")
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
    CommunityCommentCell()
}
