//
//  ThreadPostOtherView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct ThreadPostOtherView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    @StateObject private var viewModel = FeedViewModel()
    private var index: Int
    
    init(viewModel: FeedViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        NavigationLink {
            DetailedThreadView(viewModel: viewModel, index: index)
                .navigationBarBackButtonHidden()
        } label: {
            VStack(alignment: .leading, spacing: 8) {
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
                            .foregroundStyle(Color(.systemGray))
                    }
                    Text("12h")
                        .font(.system(size: 13))
                        .foregroundStyle(Color(.systemGray))
                    Spacer()
                }
                Text(viewModel.threadposts[index].postTitle)
                    .font(.system(size: 16,weight: .semibold))
                    .foregroundStyle(Color(.black))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                BadgeTag(badge: .paige)
                Text(viewModel.threadposts[index].postSubTitle ?? "")
                    .font(.system(size: 16))
                    .foregroundStyle(Color(.black))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                if let postURL = viewModel.threadposts[index].postURL, !postURL.isEmpty {
                    Image(postURL)
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: 370, maxHeight: 400, alignment: .top)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(maxWidth: .infinity, alignment: .center)
                } else {
                    EmptyView()
                }
                
                HStack(spacing: 3) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 20,height: 17)
                        .foregroundStyle(Color(ghoodPink))
                    Text("\(viewModel.threadposts[index].postLikes)")
                        .foregroundStyle(Color(ghoodPink))
                        .font(.system(size: 13))
                    Spacer()
                    Text("43 comments")
                        .foregroundStyle(Color(ghoodPink))
                        .font(.system(size: 13))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
        }
    }
}

#Preview {
    ThreadPostOtherView(viewModel: FeedViewModel(), index: 0)
}
