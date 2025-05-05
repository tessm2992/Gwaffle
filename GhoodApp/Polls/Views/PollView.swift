//
//  PollView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import SwiftUI

struct PollView: View {
    let poll: Poll
    @ObservedObject var viewModel: PostViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image("threadpic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("g/summmerhousebravo")
                            .font(.system(size: 14,weight: .semibold))
                            .foregroundStyle(Color(ghoodPink))
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
            Text(poll.question)
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(.bottom, 4)
            
            ForEach(poll.options) { option in
                PollOptionView(
                    option: option,
                    poll: poll,
                    isSelected: viewModel.isOptionSelected(poll: poll, option: option),
                    totalVotes: viewModel.getTotalVotes(for: poll),
                    viewModel: viewModel
                )
            }
            
            if poll.allowMultipleVotes {
                Text("Multiple votes allowed")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.top, 4)
            }
        }
        .padding()
        .background(Color(.white.opacity(0.8)))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.systemGray4), lineWidth: 1)
            
        )
    }
}

// Updated PollOptionView
struct PollOptionView: View {
    let option: PollOption
    let poll: Poll
    let isSelected: Bool
    let totalVotes: Int
    @ObservedObject var viewModel: PostViewModel
    
    var optionPercentage: Double {
        if totalVotes == 0 { return 0 }
        return Double(option.votes) / Double(totalVotes)
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Background bar showing vote percentage
            GeometryReader { geometry in
                Rectangle()
                    .fill(Color(.blue.opacity(0.1)))
                    .frame(width: geometry.size.width * CGFloat(optionPercentage))
                    .animation(.easeInOut(duration: 0.3), value: optionPercentage)
            }
            
            HStack {
                // Vote button
                Button(action: {
                    viewModel.toggleVote(for: option, in: poll)
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(width: 24, height: 24)
                            .background(
                                isSelected ?
                                RoundedRectangle(cornerRadius: 4).fill(Color.blue.opacity(0.7)) :
                                RoundedRectangle(cornerRadius: 4).fill(Color.clear)
                            )
                        
                        if isSelected {
                            Image(systemName: "checkmark")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                // Option text
                Text(option.text)
                    .foregroundColor(.black)
                    .padding(.leading, 8)
                
                Spacer()
                
                // Vote count
                Text("\(option.votes)")
                    .foregroundColor(.black.opacity(0.7))
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
        }
        .frame(height: 44)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}
