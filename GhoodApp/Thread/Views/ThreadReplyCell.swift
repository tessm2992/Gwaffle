//
//  ThreadReplyCell.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/3/25.
//

import SwiftUI

struct ThreadReplyCell: View {
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
                Spacer(minLength: 30)
                NavigationLink {
                    ProfileVisitorView(showBackButton: true, showNickname: false)
                        .navigationBarBackButtonHidden()
                } label: {
                    Image(viewModel.threadcomments[index].owner?.profileImageName ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 25,height: 25)
                        .clipShape(Circle())
                }
                VStack(alignment: .leading) {
                    VStack(alignment: .leading,spacing: 4) {
                        HStack {
                            NavigationLink {
                                ProfileVisitorView(showBackButton: true, showNickname: false)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text(viewModel.threadcomments[index].owner?.userName ?? "")
                                    .font(.system(size: 14,weight: .semibold))
                            }
                            Image(systemName: "arrowtriangle.right.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 8,height: 8)
                            NavigationLink {
                                ProfileVisitorView(showBackButton: true, showNickname: false)
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text(viewModel.threadcomments[index].owner?.userName ?? "")
                                    .font(.system(size: 14,weight: .semibold))
                            }
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
                                    .font(.system(size: 13))
                                    .foregroundStyle(Color(ghoodPink))
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
    ThreadReplyCell(viewModel: FeedViewModel(), index: 0)
}
