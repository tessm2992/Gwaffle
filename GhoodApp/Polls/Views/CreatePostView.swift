//
//  CreatePostView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import SwiftUI

struct CreatePostView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: PostViewModel
    
    @State private var postText = ""
    @State private var showingPollCreation = false
    @State private var hasPoll = false
    @State private var pollQuestion = ""
    @State private var pollOptions: [String] = ["", ""]
    @State private var allowMultipleVotes = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextEditor(text: $postText)
                        .frame(minHeight: 100)
                }
                
                if hasPoll {
                    Section(header: Text("Poll Preview")) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(pollQuestion)
                                .font(.headline)
                            
                            ForEach(pollOptions.filter { !$0.isEmpty }, id: \.self) { option in
                                HStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                        .frame(width: 24, height: 24)
                                    
                                    Text(option)
                                        .foregroundColor(.primary)
                                }
                            }
                            
                            if allowMultipleVotes {
                                Text("Multiple votes allowed")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                
                Section {
                    HStack {
                        Button(action: {
                            showingPollCreation = true
                        }) {
                            HStack {
                                Image(systemName: hasPoll ? "chart.bar.fill" : "chart.bar")
                                    .foregroundColor(hasPoll ? .blue : .gray)
                                Text(hasPoll ? "Edit Poll" : "Add Poll")
                                    .foregroundColor(hasPoll ? .blue : .gray)
                            }
                        }
                        
                        if hasPoll {
                            Button(action: {
                                hasPoll = false
                                pollQuestion = ""
                                pollOptions = ["", ""]
                                allowMultipleVotes = false
                            }) {
                                Text("Remove Poll")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Create Post")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Post") {
                    var pollId: UUID? = nil
                    if hasPoll && !pollQuestion.isEmpty && pollOptions.filter({ !$0.isEmpty }).count >= 2 {
                        pollId = viewModel.createPoll(
                            question: pollQuestion,
                            options: pollOptions.filter { !$0.isEmpty },
                            allowMultipleVotes: allowMultipleVotes
                        )
                    }
                    viewModel.createPost(text: postText, pollId: pollId)
                    dismiss()
                }
                .disabled(postText.isEmpty && !hasPoll)
            )
            .sheet(isPresented: $showingPollCreation) {
                NavigationView {
                    Form {
                        Section(header: Text("Poll Question")) {
                            TextField("Enter your question", text: $pollQuestion)
                        }
                        
                        Section(header: Text("Options")) {
                            ForEach(0..<pollOptions.count, id: \.self) { index in
                                TextField("Option \(index + 1)", text: $pollOptions[index])
                            }
                            
                            Button(action: {
                                pollOptions.append("")
                            }) {
                                Label("Add Option", systemImage: "plus.circle")
                            }
                        }
                        
                        Section {
                            Toggle("Allow Multiple Votes", isOn: $allowMultipleVotes)
                        }
                    }
                    .navigationTitle("Create Poll")
                    .navigationBarItems(
                        leading: Button("Cancel") {
                            showingPollCreation = false
                        },
                        trailing: Button("Done") {
                            if !pollQuestion.isEmpty && pollOptions.filter({ !$0.isEmpty }).count >= 2 {
                                hasPoll = true
                                showingPollCreation = false
                            }
                        }
                        .disabled(pollQuestion.isEmpty || pollOptions.filter { !$0.isEmpty }.count < 2)
                    )
                }
            }
        }
    }
} 