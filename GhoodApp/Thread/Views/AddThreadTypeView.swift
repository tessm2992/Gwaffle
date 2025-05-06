//
//  AddThreadTypeView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/1/25.
//

import SwiftUI

struct AddThreadTypeView: View {
    // Environment variable to dismiss the view
    @Environment(\.dismiss) private var dismiss
    
    // State to track which tag is selected (using optional Int instead of Set)
    @State private var selectedTagId: Int? = nil
    
    // Pink color for the app
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    // Tag definitions
    private let tags = [
        (id: 0, name: "🎙️ Banter", color: Color.teal),
        (id: 1, name: "🍿 Pop Culture", color: Color.orange),
        (id: 2, name: "🎨 Lifestyle", color: Color.blue),
        (id: 3, name: "❤️‍🔥 Relationships", color: Color(hex: "#FF4C29")),
        (id: 4, name: "🤰 Maternity", color: Color.purple),
        (id: 5, name: "🏡 Family", color: Color(hex: "#006400")),
        (id: 6, name: "🏥 Health", color: Color.red),
        (id: 7, name: "💪 Fitness", color: Color.green),
        (id: 8, name: "🧖‍♀️ Beauty & Wellness", color: Color(hex: "#EC4899"))
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
                    Text("THREAD CATEGORY")
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
                                HStack(alignment: .center, spacing: 6) {
                                    // Circle indicator that shows filled when selected
                                    ZStack {
                                        Circle()
                                            .stroke(Color.black.opacity(0.7), lineWidth: 1.5)
                                            .frame(width: 24, height: 24)
                                        
                                        if selectedTagId == tag.id {
                                            Circle()
                                                .fill(Color.black.opacity(0.7))
                                                .frame(width: 16, height: 16)
                                        }
                                    }
                                    
                                    // Capsule only around the text
                                    Text(tag.name)
                                        .font(.system(size: 20, weight: .semibold))
                                        .padding(.vertical, 6)
                                        .padding(.horizontal, 10)
                                        .foregroundColor(tag.color)
                                    
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
                        Text("Select")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 80, height: 35)
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
    AddThreadTypeView()
}
