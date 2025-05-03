//
//  TagView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct TagView: TagItemView {
    let tag: Tag
    let isSelected: Bool
    let action: () -> Void
    
    var id: Int {
        return tag.id
    }
    
    var body: some View {
        Button(action: action) {
            Text(tag.name)
                .font(.subheadline)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color(.systemGray2) : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .black : .primary)
                .cornerRadius(16)
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(
            tag: Tag(id: 1, name: "Local & Neighborhood"),
            isSelected: true,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
