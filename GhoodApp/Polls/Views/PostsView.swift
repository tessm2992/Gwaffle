//
//  PostsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import SwiftUI

struct PostsView: View {
    @ObservedObject var viewModel: PostViewModel
    @State private var showingCreatePost = false
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading, spacing: 16) {
                    Text(post.text)
                        .font(.body)
                    
                    if let pollId = post.pollId,
                       let poll = viewModel.getPoll(for: pollId) {
                        PollView(poll: poll, viewModel: viewModel)
                    }
                }
                .padding(.vertical, 8)
                .listRowInsets(EdgeInsets())
            }
        }
        .navigationTitle("Posts")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showingCreatePost = true
                }) {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $showingCreatePost) {
            CreatePostView(viewModel: viewModel)
        }
    }
}
