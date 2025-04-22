//
//  ThreadPostView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct ThreadPostView: View {
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
            VStack(alignment: .leading,spacing: 6) {
                HStack {
                    NavigationLink {
                        ThreadView(viewModel: viewModel, index: index)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image(viewModel.threadposts[index].page?.pageURL ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 40)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading,spacing: 3) {
                        NavigationLink {
                            ThreadView(viewModel: viewModel, index: index)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text(viewModel.threadposts[index].page?.pageTitle ?? "")
                                .font(.system(size: 14,weight: .semibold))
                                .foregroundStyle(Color(ghoodPink))
                        }
                        Text("12h")
                            .font(.system(size: 11))
                            .foregroundStyle(Color(.systemGray))
                    }
                    Spacer()
                }
                .padding(.horizontal)
                Text(viewModel.threadposts[index].postTitle)
                    .font(.system(size: 14,weight: .semibold))
                    .foregroundStyle(Color(.black))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                Text(viewModel.threadposts[index].postSubTitle ?? "")
                    .font(.system(size: 12))
                    .foregroundStyle(Color(.black))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                Image(viewModel.threadposts[index].postURL ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .clipped()
                HStack(spacing: 3) {
                    Image(systemName: "hand.thumbsup.circle.fill")
                        .resizable()
                        .frame(width: 18,height: 18)
                        .foregroundStyle(Color(ghoodPink))
                    Text("\(viewModel.threadposts[index].postLikes)")
                        .foregroundStyle(Color(.systemGray))
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
    ThreadPostView(viewModel: FeedViewModel(),index: 0)
}
    
