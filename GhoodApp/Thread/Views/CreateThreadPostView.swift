//
//  CreateThreadPostView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI
import PhotosUI

struct CreateThreadPostView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = PostViewModel()
    @State private var mindText: String = ""
    @State private var selectedPhotoItem: PhotosPickerItem?
    @State private var selectedPhoto: UIImage?
    @State private var showPhotoPicker = false
    @State private var showingPollCreation = false
    @State private var hasPoll = false
    @State private var pollQuestion = ""
    @State private var pollOptions: [String] = ["", ""]
    @State private var allowMultipleVotes = false
    
    var body: some View {
        // Use NavigationView instead of NavigationStack for better compatibility
        NavigationView {
            VStack(spacing: 0) {
                // Main content area
                VStack(alignment: .leading, spacing: 0) {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 15) {
                            // Header
                            HStack(alignment: .top) {
                                Image("avatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                Text("tessm345")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 5)
                            
                            // Content
                            VStack(alignment: .leading, spacing: 15) {
                                // Thread Selection
                                NavigationLink {
                                    SelectThreadView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    HStack {
                                        Text("Select a thread")
                                            .font(.headline)
                                        VStack {
                                            Image(systemName: "chevron.up")
                                            Image(systemName: "chevron.down")
                                        }
                                        .font(.system(size: 14))
                                    }
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.black)
                                    .frame(width: 180, height: 35)
                                    .background(Color(.systemGray6))
                                    .clipShape(RoundedRectangle(cornerRadius: 30))
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 5)
                                
                                // Title
                                TextField("Title", text: $mindText)
                                    .font(.system(size: 25, weight: .semibold))
                                    .padding(.horizontal)
                                    .padding(.bottom, 5)
                                
                                // Tags
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("THREAD TAG (optional)")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(Color(.systemGray))
                                    
                                    // Tags NavigationLink
                                    NavigationLink {
                                        AddTagsView()
                                            .navigationBarBackButtonHidden()
                                    } label: {
                                        HStack(spacing: 4) {
                                            Image(systemName: "plus")
                                            Text("Add")
                                        }
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(ghoodPink)
                                        .frame(width: 90, height: 35)
                                        .overlay {
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(ghoodPink, lineWidth: 1)
                                        }
                                    }
                                    .padding(.bottom, 5)
                                    
                                    // Subtitle
                                    TextField("Sub title (optional)", text: $mindText)
                                        .font(.system(size: 20))
                                    
                                    // Poll Preview
                                    if hasPoll {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text(pollQuestion)
                                                .font(.headline)
                                                .foregroundColor(.black)
                                            
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
                                            
                                            Button(action: {
                                                showingPollCreation = true
                                            }) {
                                                Text("Edit Poll")
                                                    .foregroundColor(.blue)
                                            }
                                        }
                                        .padding(.vertical, 5)
                                    }
                                }
                                .padding(.horizontal)
                                
                                // Photo Preview
                                if let selectedPhoto = selectedPhoto {
                                    Image(uiImage: selectedPhoto)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(maxHeight: 200)
                                        .padding()
                                }
                                
                                Spacer(minLength: 0)
                            }
                        }
                        .padding(.top, 10)
                    }
                    
                    // Bottom Toolbar - Now directly attached to the bottom
                    VStack(spacing: 0) {
                        Divider()
                        HStack {
                            Spacer()
                            PhotosPicker(selection: $selectedPhotoItem,
                                         matching: .any(of: [.images, .videos])) {
                                Image(systemName: "photo.fill.on.rectangle.fill")
                                    .foregroundStyle(.green)
                                    .imageScale(.large)
                            }
                            .onChange(of: selectedPhotoItem) { oldValue, newValue in
                                Task {
                                    if let data = try? await newValue?.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        selectedPhoto = uiImage
                                    }
                                }
                            }
                            Spacer()
                            Button(action: {}) {
                                Image(systemName: "link")
                                    .foregroundStyle(.blue)
                                    .fontWeight(.bold)
                                    .imageScale(.large)
                            }
                            Spacer()
                            Button(action: {
                                showingPollCreation = true
                            }) {
                                Image(systemName: "chart.bar.fill")
                                    .foregroundStyle(hasPoll ? .orange : .orange)
                                    .imageScale(.large)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 8)
                    }
                }
                // Critical: Navigation title and top bar items
                .navigationTitle("Create Post")
                .navigationBarTitleDisplayMode(.inline)
                // Key fix: Navigation bar items explicitly defined here
                .navigationBarItems(
                    leading: Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .imageScale(.large)
                    },
                    trailing: Button(action: {
                        var pollId: UUID? = nil
                        if hasPoll && !pollQuestion.isEmpty && pollOptions.filter({ !$0.isEmpty }).count >= 2 {
                            pollId = viewModel.createPoll(
                                question: pollQuestion,
                                options: pollOptions.filter { !$0.isEmpty },
                                allowMultipleVotes: allowMultipleVotes
                            )
                        }
                        viewModel.createPost(text: mindText, pollId: pollId)
                        dismiss()
                    }) {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 80, height: 35)
                            .foregroundStyle(mindText.count == 0 && !hasPoll ? Color(.darkGray) : .white)
                            .background(mindText.count == 0 && !hasPoll ? Color(.systemGray5) : ghoodPink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .disabled(mindText.count == 0 && !hasPoll)
                )
            }
            // Sheet presentation for poll creation
            .sheet(isPresented: $showingPollCreation) {
                NavigationView {
                    CreatePollView(
                        pollQuestion: $pollQuestion,
                        pollOptions: $pollOptions,
                        allowMultipleVotes: $allowMultipleVotes,
                        onDone: {
                            hasPoll = true
                            showingPollCreation = false
                        },
                        onCancel: {
                            showingPollCreation = false
                        }
                    )
                }
            }
        }
    }
}
