//
//  PollsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import SwiftUI

struct PollsView: View {
    @ObservedObject var viewModel: PostViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    CapsuleSearchBarFive()
                    ZStack {
                        Color.white.edgesIgnoringSafeArea(.all)
                        
                        ScrollView {
                            LazyVStack(spacing: 20) {
                                ForEach(viewModel.polls) { poll in
                                    PollView(poll: poll, viewModel: viewModel)
                                        .padding(.horizontal)
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading) {
                            HStack {
                                Text("Polls")
                                    .font(.custom("Anton-Regular", size: 28))
                                    .foregroundStyle(Color(.black))
                                    .padding(.bottom,10)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    NavigationView {
        PollsView(viewModel: {
            let viewModel = PostViewModel()
            // Add sample polls with some votes
            let poll1 = Poll(
                question: "What's your favorite season?",
                options: [
                    PollOption(text: "Spring", votes: 12),
                    PollOption(text: "Summer", votes: 28),
                    PollOption(text: "Fall", votes: 15),
                    PollOption(text: "Winter", votes: 8)
                ],
                allowMultipleVotes: false
            )
            let poll2 = Poll(
                question: "Which social media platforms do you use?",
                options: [
                    PollOption(text: "Instagram", votes: 42),
                    PollOption(text: "Twitter", votes: 35),
                    PollOption(text: "Facebook", votes: 20),
                    PollOption(text: "TikTok", votes: 38)
                ],
                allowMultipleVotes: true
            )
            viewModel.polls = [poll1, poll2]
            return viewModel
        }())
    }
}
