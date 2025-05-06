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
                VStack(alignment: .leading, spacing: 11) {
                    HStack {
                        NavigationLink {
                            ProfileVisitorView(showBackButton: true, showNickname: true)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image("avatar")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                        }
                        NavigationLink {
                            ProfileVisitorView(showBackButton: true, showNickname: true)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text("Tess M")
                                .font(.system(size: 14,weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                        }
                        Text("12h")
                            .font(.system(size: 13))
                            .foregroundStyle(Color(.systemGray))
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical,2)
                    Text("This is the body of the posts. It can a lot of sentences so I'm typing this as a placeholder. I can ask questions or just post something related to the community page topic")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.bottom, 0)
                    HStack(spacing: 4) {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20,height: 17)
                            .foregroundStyle(Color(ghoodPink))
                        Text("24")
                            .foregroundStyle(Color(.black.opacity(0.7)))
                        Spacer()
                        Text("43 comments")
                            .foregroundStyle(Color(.black.opacity(0.7)))
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .font(.system(size: 13))
                    DividerThinnestView(width: proxy.size.width)
                    CommunityCommentCell()
                    CommunityReplyCell()
                    ForEach(0 ..< 4, id: \.self) { index in
                        CommunityCommentCell()
                    }
                }
            }
            .scrollIndicators(.hidden)
            .foregroundStyle(Color(.systemGray5))
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color(.black))
                    })
                }
                ToolbarItem(placement: .principal) {
                    Button(action: {dismiss()}, label: {
                        Text("Tinx's Army")
                            .foregroundStyle(Color(.black))
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
