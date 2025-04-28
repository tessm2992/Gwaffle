//
//  ThreadCommentCell.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct ThreadCommentCell: View {
    let ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    @StateObject private var viewModel = FeedViewModel()
    private var index: Int
    
    init(viewModel: FeedViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top, spacing: 8) {
                NavigationLink {
                    ProfileView(showBackButton: true)
                        .navigationBarBackButtonHidden()
                } label: {
                    Image(viewModel.threadcomments[index].owner?.profileImageName ?? "")
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
                            Text(viewModel.threadcomments[index].owner?.userName ?? "")
                                .font(.system(size: 13,weight: .semibold))
                                .foregroundStyle(Color(.black))
                        }
                        Text(viewModel.threadcomments[index].text)
                            .font(.system(size: 16))
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
                        Button(action: {},
                               label: {
                            Text("Reply")
                                .font(.system(size: 11,weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                                .padding(.top, 2)
                        })
                        Spacer()
                        HStack(spacing: 3) {
                            Text("3")
                                .font(.system(size: 11))
                                .foregroundStyle(Color(ghoodPink))
                            Image(systemName: "heart")
                                .resizable()
                                .frame(width: 20,height: 17)
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
    ThreadCommentCell(viewModel: FeedViewModel(), index: 0)
}

