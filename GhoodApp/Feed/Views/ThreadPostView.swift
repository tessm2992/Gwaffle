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
            VStack(alignment: .leading,spacing: 8) {
                HStack {
                    NavigationLink {
                        ThreadView(viewModel: viewModel, index: index)
                            .navigationBarBackButtonHidden()
                    } label: {
                        Image(viewModel.threadposts[index].page?.pageURL ?? "")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40,height: 40)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            NavigationLink {
                                ThreadView(viewModel: viewModel, index: index)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text(viewModel.threadposts[index].page?.pageTitle ?? "")
                                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                                    .foregroundStyle(.black.opacity(0.8))
                            }
                            Spacer()
                
                        }
                        HStack {
                            Text("12h")
                                .font(.system(size: 11))
                                .foregroundStyle(Color(.systemGray))
                            Spacer()
                        }
                    }
                }
                Text(viewModel.threadposts[index].postTitle)
                    .font(.system(size: 16,weight: .semibold))
                    .foregroundStyle(Color(.black))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
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
                        .foregroundStyle(Color(.black.opacity(0.7)))
                        .font(.system(size: 14))
                    Spacer()
                    Text("43 comments")
                        .foregroundStyle(Color(.black.opacity(0.7)))
                        .font(.system(size: 14))
                }
            }
            .padding(.horizontal)
            .padding(.vertical)
            .background(Color(.white))
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

#Preview {
    ThreadPostView(viewModel: FeedViewModel(),index: 0)
}
    
