//
//  FeedbackSheetView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct FeedbackSheetView: View {
    @Binding var feedbackText: String
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("How can we improve?")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top)
            
            ZStack(alignment: .topLeading) {
                if feedbackText.isEmpty {
                    Text("Tell us what you think...")
                        .foregroundColor(.gray.opacity(0.7))
                        .padding(.top, 8)
                        .padding(.leading, 5)
                }
                
                TextEditor(text: $feedbackText)
                    .frame(height: 150)
                    .padding(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            
            HStack {
                Button {
                    isPresented = false
                    // Reset feedback text
                    feedbackText = ""
                } label: {
                    Text("Cancel")
                        .fontWeight(.medium)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                
                Button {
                    // Submit feedback logic here
                    // Then dismiss
                    isPresented = false
                    feedbackText = ""
                } label: {
                    Text("Submit")
                        .fontWeight(.medium)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(feedbackText.isEmpty ? Color(.systemGray5) : .blue)
                        .foregroundColor(feedbackText.isEmpty ? .gray : .white)
                        .cornerRadius(8)
                }
                .disabled(feedbackText.isEmpty)
            }
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    FeedbackSheetView(feedbackText: .constant("the app is glitchy"), isPresented: .constant(true))
}
