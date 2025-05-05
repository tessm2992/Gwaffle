//
//  CreatePollView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//


import SwiftUI

struct CreatePollView: View {
    @Binding var pollQuestion: String
    @Binding var pollOptions: [String]
    @Binding var allowMultipleVotes: Bool
    let onDone: () -> Void
    let onCancel: () -> Void
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // Custom header
                HStack {
                    Button(action: onCancel) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 17, weight: .semibold))
                            .padding()
                    }
                    
                    Spacer()
                    
                    Text("Create Poll")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        if !pollQuestion.isEmpty && pollOptions.filter({ !$0.isEmpty }).count >= 2 {
                            onDone()
                        }
                    }) {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                !pollQuestion.isEmpty && pollOptions.filter({ !$0.isEmpty }).count >= 2
                                ? Color.blue
                                : Color.gray
                            )
                            .clipShape(Capsule())
                    }
                    .disabled(pollQuestion.isEmpty || pollOptions.filter { !$0.isEmpty }.count < 2)
                    .padding(.trailing)
                }
                .padding(.top, 8)
                .background(Color.white)
                
                Divider()
                
                // Form content
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Poll Question
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Poll Question")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            TextField("Enter your question", text: $pollQuestion)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .foregroundColor(.black)
                        }
                        
                        // Poll Options
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Options")
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            ForEach(0..<pollOptions.count, id: \.self) { index in
                                TextField("Option \(index + 1)", text: $pollOptions[index])
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .cornerRadius(8)
                                    .foregroundColor(.black)
                            }
                            
                            Button(action: {
                                pollOptions.append("")
                            }) {
                                HStack {
                                    Image(systemName: "plus.circle.fill")
                                    Text("Add Option")
                                }
                                .padding()
                                .foregroundColor(.blue)
                            }
                        }
                        
                        // Allow Multiple Votes Toggle
                        HStack {
                            Text("Allow others to add options")
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Toggle("", isOn: $allowMultipleVotes)
                                .labelsHidden()
                        }
                        .padding(.top, 8)
                        
                        // Allow Multiple Votes Toggle
                        HStack {
                            Text("Allow others to vote for multiple")
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Toggle("", isOn: $allowMultipleVotes)
                                .labelsHidden()
                        }
                        .padding(.top, 8)
                    }
                    .padding()
                }
            }
        }
        .preferredColorScheme(.light) // Force light mode for this view
    }
}

// Preview for CreatePollView
struct CreatePollView_Previews: PreviewProvider {
    @State static var question = "What's your favorite color?"
    @State static var options = ["Red", "Blue", "Green", ""]
    @State static var allowMultiple = false
    
    static var previews: some View {
        NavigationView {
            CreatePollView(
                pollQuestion: $question,
                pollOptions: $options,
                allowMultipleVotes: $allowMultiple,
                onDone: {},
                onCancel: {}
            )
        }
    }
}
