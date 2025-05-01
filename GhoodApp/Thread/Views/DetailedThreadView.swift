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
    
    @StateObject private var viewModel = FeedViewModel()
    private var index: Int
    
    init(viewModel: FeedViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        NavigationLink {
                            ProfileVisitorView(showBackButton: true, showNickname: false)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Image(viewModel.threadposts[index].owner?.profileImageName ?? "")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 20,height: 20)
                                .clipShape(Circle())
                        }
                        NavigationLink {
                            ProfileVisitorView(showBackButton: true, showNickname: false)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text(viewModel.threadposts[index].owner?.userName ?? "")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundStyle(Color(.gray))
                        }
                        Text("12h")
                            .font(.system(size: 13))
                            .foregroundStyle(Color(.systemGray))
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical,2)
                    Text(viewModel.threadposts[index].postTitle)
                        .font(.system(size: 16,weight: .semibold))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.bottom, 0)
                    BadgeTag(badge: .paige)
                        .padding(.horizontal)
                        .padding(.bottom, 0)
                    Text(viewModel.threadposts[index].postSubTitle ?? "")
                        .font(.system(size: 16))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.top, 0)
                    if let postURL = viewModel.threadposts[index].postURL, !postURL.isEmpty {
                        Image(postURL)
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .top)
                                .clipped()
                    } else {
                        EmptyView()
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20,height: 17)
                            .foregroundStyle(Color(ghoodPink))
                        Text("\(viewModel.threadposts[index].postLikes)")
                            .foregroundStyle(Color(ghoodPink))
                        Spacer()
                        Text("43 comments")
                            .foregroundStyle(Color(ghoodPink))
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    .font(.system(size: 13))
                    ForEach(0 ..< viewModel.threadcomments.count, id: \.self) { index in
                        ThreadCommentCell(viewModel: viewModel, index: index)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .foregroundStyle(Color(.systemGray5))
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color(.black))
                    })
                }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(viewModel.threadposts[index].page?.pageURL ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 35,height: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        Text(viewModel.threadposts[index].page?.pageTitle ?? "")
                            .foregroundStyle(Color(ghoodPink))
                            .font(.system(size: 17,weight: .semibold))
                    }
                }
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    DetailedThreadView(viewModel: FeedViewModel(), index: 0)
}
