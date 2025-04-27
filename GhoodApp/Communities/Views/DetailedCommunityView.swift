//
//  DetailedCommunityView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/21/25.
//

import SwiftUI

struct DetailedCommunityView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        NavigationLink {
                            ProfileView(showBackButton: true)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                        }
                        NavigationLink {
                            ProfileView(showBackButton: true)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("tessm345")
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
                    Text("This is the header of the posts. It can be one or two sentences")
                        .font(.system(size: 14,weight: .semibold))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.bottom, 0)
                    Text("This is a placeholder subtitle thread. It's where more context from the header is placed. This is optional and can be longer than the header comment")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.top, 0)
                    HStack(spacing: 4) {
                        Image(systemName: "hand.thumbsup.circle.fill")
                            .resizable()
                            .frame(width: 18,height: 18)
                            .foregroundStyle(Color(ghoodPink))
                        Text("24")
                            .foregroundStyle(Color(ghoodPink))
                        Spacer()
                        Text("43 comments")
                            .foregroundStyle(Color(ghoodPink))
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    .font(.system(size: 13))
                    ForEach(0 ..< 5, id: \.self) { index in
                        CommunityCommentCell()
                    }
                }
            }
            .scrollIndicators(.hidden)
            .foregroundStyle(Color(.systemGray5))
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color(ghoodPink))
                    })
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Text("Tinx's Army")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
            }
        }
    }
}

#Preview {
    DetailedCommunityView()
}
