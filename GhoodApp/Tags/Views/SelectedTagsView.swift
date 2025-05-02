//
//  SelectedTagsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct SelectedTagsView: View {
    let selectedTags: Set<Tag>
    let onTagRemoved: (Tag) -> Void
    
    var body: some View {
        if selectedTags.isEmpty {
            Text("No tags selected")
                .font(.subheadline)
                .italic()
                .foregroundColor(.secondary)
        } else {
            HorizontalFlowLayout(items: Array(selectedTags).map { tag in
                SelectedTagView(
                    tag: tag,
                    onRemove: { onTagRemoved(tag) }
                )
            })
            .frame(height: 150) // Set a fixed height or use GeometryReader
        }
    }
}

struct SelectedTagsView_Previews: PreviewProvider {
    static let selectedTags: Set<Tag> = [
        Tag(id: 1, name: "Local & Neighborhood"),
        Tag(id: 2, name: "Social")
    ]
    
    static var previews: some View {
        SelectedTagsView(
            selectedTags: selectedTags,
            onTagRemoved: { _ in }
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
