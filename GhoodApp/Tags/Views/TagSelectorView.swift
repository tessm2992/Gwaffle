//
//  TagSelectorView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct TagSelectorView: View {
    @StateObject private var viewModel = TagSelectorViewModel()
    @Environment(\.dismiss) private var dismiss
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Tag selector section
            VStack(alignment: .leading) {
                TagSelectorHeaderView()
                
                TagCloudView(
                    tags: viewModel.availableTags,
                    selectedTags: viewModel.selectedTags,
                    onTagSelected: viewModel.toggleTag
                )
            }
            
            // Selected tags preview section
            VStack(alignment: .leading) {
                SelectedTagsHeaderView()
                
                SelectedTagsView(
                    selectedTags: viewModel.selectedTags,
                    onTagRemoved: viewModel.toggleTag
                )
            }
            
            Spacer()
        }
        .padding()
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color(.black))
                })
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    // Action for adding the tags
                    dismiss() // Add this to dismiss the view after selecting tags
                }, label: {
                    Text("Add")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(width: 70, height: 35)
                        .foregroundStyle((viewModel.selectedTags.isEmpty) ? Color(.darkGray) : .white)
                        .background((viewModel.selectedTags.isEmpty) ? Color(.systemGray5) : ghoodPink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                })
                .disabled(viewModel.selectedTags.isEmpty)
            }
        }
    }
}

struct TagSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TagSelectorView()
        }
    }
}
