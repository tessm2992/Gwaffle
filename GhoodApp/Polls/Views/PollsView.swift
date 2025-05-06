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
                VStack(alignment: .leading) {
                    CapsuleSearchBarFive()
                        .padding(.top, 5)
                    VStack(alignment: .leading) {
                        Text("POLLS RELATED TO...")
                            .font(.system(size: 15,weight: .semibold))
                            .foregroundStyle(Color(.systemGray))
                        HStack {
                            Text("🎙️ Banter")
                                .padding(.horizontal, 11)
                                .padding(.vertical,8)
                                .foregroundColor(.teal)
                                .background(Color.teal.opacity(0.05))
                                .clipShape(Capsule())
                            Text("🍿 Pop Culture")
                                .padding(.horizontal, 11)
                                .padding(.vertical, 8)
                                .foregroundColor(.orange)
                                .background(Color.orange.opacity(0.05))
                                .clipShape(Capsule())
                        }
                        HStack {
                            Text("🎨 Lifestyle")
                                .padding(.horizontal, 11)
                                .padding(.vertical,8)
                                .foregroundColor(.blue)
                                .background(Color.blue.opacity(0.05))
                                .clipShape(Capsule())
                            Text("❤️‍🔥 Relationships")
                                .padding(.horizontal, 11)
                                .padding(.vertical, 8)
                                .foregroundColor(Color(hex: "#FF4C29"))
                                .background(Color(hex: "#FF4C29").opacity(0.05))
                                .clipShape(Capsule())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                    LazyVStack(spacing: 15) {
                        ForEach(viewModel.polls) { poll in
                            PollView(poll: poll, viewModel: viewModel)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text("Polls")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundStyle(Color(.black))
                            .padding(.bottom,10)
                            .padding(.horizontal)
                    }
                }
            }
            .background(Color(.white))
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
