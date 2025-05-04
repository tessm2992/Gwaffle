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
                    ProfileVisitorView(showBackButton: true, showNickname: false)
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
                            ProfileVisitorView(showBackButton: true, showNickname: false)
                                .navigationBarBackButtonHidden()
                        } label: {
                            Text(viewModel.threadcomments[index].owner?.userName ?? "")
                                .font(.system(size: 14,weight: .semibold))
                        }
                        .foregroundStyle(Color(.systemGray))
                        
                        Text(viewModel.threadcomments[index].text)
                            .font(.system(size: 16))
                            .foregroundStyle(Color(.black))
                            .padding(.top, 0)
                        
                        HStack(spacing: 9) {
                            Text("2h")
                                .font(.system(size: 14))
                                .foregroundStyle(Color(.systemGray))
                                .padding(.top, 2)
                            Button(action: {},
                                   label: {
                                Text("Reply")
                                    .font(.system(size: 14,weight: .semibold))
                                    .foregroundStyle(Color(.systemGray))
                                    .padding(.top, 2)
                            })
                            Spacer()
                            HStack(spacing: 3) {
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 20,height: 17)
                                    .foregroundStyle(Color(ghoodPink))
                                Text("3")
                                    .foregroundStyle(Color(.black.opacity(0.7)))
                                    .font(.system(size: 14))
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

#Preview {
    ThreadCommentCell(viewModel: FeedViewModel(), index: 0)
}

