//
//  ThreadHeaderView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct ThreadHeaderView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    
    @StateObject private var viewModel = FeedViewModel()
    private var index: Int
    
    init(viewModel: FeedViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(viewModel.threadposts[index].page?.pageURL ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 3) {
                    Text(viewModel.threadposts[index].page?.pageTitle ?? "")
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundStyle(Color(ghoodPink))
                    Text("2.7k followers")
                        .font(.system(size: 14))
                        .foregroundStyle(Color(.systemGray))
                }
                Spacer()
                FollowButtonView()
            }
            .padding(.horizontal)
            Text(viewModel.threadposts[index].page?.pageAbout ?? "")
                .font(.system(size: 14))
                .foregroundStyle(Color(.black))
                .padding(.horizontal)
                .padding(.top,1)
            HStack {
                NavigationLink {
                    ThreadAboutView(viewModel: viewModel, index: index)
                        .navigationBarBackButtonHidden()
                } label: {
                    Text("see more")
                        .font(.system(size: 14,weight: .semibold))
                        .foregroundStyle(Color(.black))
                        .padding(.horizontal)
                        .padding(.top,5)
                }
                NavigationLink {
                    ThreadCategoryView()
                        .navigationBarBackButtonHidden()
                } label: {
                    Text(viewModel.threadposts[index].page?.pageCategory ?? "")
                        .font(.system(size: 14,weight: .semibold))
                        .foregroundStyle(Color(.orange))
                        .padding(.top,5)
                }
                
            }
            
        }
    }
}

#Preview {
    ThreadHeaderView(viewModel: FeedViewModel(), index: 0)
}
