//
//  TagCloudView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct TagCloudView: View {
    let tags: [Tag]
    let selectedTags: Set<Tag>
    let onTagSelected: (Tag) -> Void
    
    var body: some View {
        HorizontalFlowLayout(items: tags.map { tag in
            TagView(
                tag: tag,
                isSelected: selectedTags.contains(tag),
                action: { onTagSelected(tag) }
            )
        })
        .frame(height: 150) // Set a fixed height or use GeometryReader
    }
}

struct TagCloudView_Previews: PreviewProvider {
    static let sampleTags = [
        Tag(id: 1, name: "Local & Neighborhood"),
        Tag(id: 2, name: "Social"),
        Tag(id: 3, name: "Support")
    ]
    
    static let selectedTags: Set<Tag> = [
        Tag(id: 1, name: "Local & Neighborhood")
    ]
    
    static var previews: some View {
        TagCloudView(
            tags: sampleTags,
            selectedTags: selectedTags,
            onTagSelected: { _ in }
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
