//
//  AddTagsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct AddTagsView: View {
    // Environment variable to dismiss the view
    @Environment(\.dismiss) private var dismiss
    
    // State to track which tag is selected (using optional Int instead of Set)
    @State private var selectedTagId: Int? = nil
    
    // Pink color for the app
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    // Tag definitions
    private let tags = [
        (id: 0, name: "Advice", color: Color.teal),
        (id: 1, name: "Recommendation", color: Color.green),
        (id: 2, name: "Rant", color: Color.orange),
        (id: 3, name: "Question", color: Color.purple),
        (id: 4, name: "Placeholder", color: Color.yellow)
    ]
    
    // Select a tag (deselects if same tag is tapped again)
    private func selectTag(_ id: Int) {
        if selectedTagId == id {
            selectedTagId = nil // Deselect if already selected
        } else {
            selectedTagId = id // Select new tag
        }
    }
    
    var body: some View {
        NavigationStack {
            HStack(alignment: .top) {
                // Left-aligned content
                VStack(alignment: .leading, spacing: 10) {
                    Text("ADD A TAG")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemGray))
                        .padding(.bottom, 8)
                    
                    // Tag list
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(tags, id: \.id) { tag in
                            Button(action: {
                                selectTag(tag.id)
                            }) {
                                HStack(alignment: .center) {
                                    // Circle indicator that shows filled when selected
                                    ZStack {
                                        Circle()
                                            .stroke(Color.black, lineWidth: 1.5)
                                            .frame(width: 24, height: 24)
                                        
                                        if selectedTagId == tag.id {
                                            Circle()
                                                .fill(Color.black)
                                                .frame(width: 16, height: 16)
                                        }
                                    }
                                    
                                    // Capsule only around the text
                                    Text(tag.name)
                                        .font(.system(size: 16, weight: .semibold))
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 10)
                                        .foregroundColor(.white)
                                        .background(tag.color)
                                        .clipShape(Capsule())
                                    
                                    Spacer(minLength: 0)
                                }
                                .padding(.vertical, 8)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    
                    Spacer()
                }
                
                Spacer(minLength: 0)
            }
            .padding()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                // X mark in the upper left
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss() // Dismiss the view
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    })
                }
                
                // Add button in the upper right
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        // Action for adding the selected tag
                        dismiss() // Dismiss the view after adding
                    }, label: {
                        Text("Add")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 100, height: 35)
                            .foregroundStyle(selectedTagId == nil ? Color(.darkGray) : .white)
                            .background(selectedTagId == nil ? Color(.systemGray5) : ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                    .disabled(selectedTagId == nil) // Disable if no tag is selected
                }
            }
        }
    }
}

#Preview {
    AddTagsView()
}
