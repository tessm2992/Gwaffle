//
//  TagSelectorView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct TagSelectorView: View {
    @StateObject private var viewModel = TagSelectorViewModel()
    
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
            
            // Form context example (Create button)
            Divider()
                .padding(.vertical)
            
            CreateCommunityButtonView(
                onCreateTapped: viewModel.createCommunity
            )
        }
        .padding()
        .navigationTitle("Create Community")
    }
}

struct TagSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TagSelectorView()
        }
    }
}
