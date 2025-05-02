//
//  SelectedTagView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct SelectedTagView: TagItemView {
    let tag: Tag
    let onRemove: () -> Void
    
    var id: Int {
        return tag.id
    }
    
    var body: some View {
        HStack(spacing: 4) {
            Text(tag.name)
                .font(.subheadline)
            
            Button(action: onRemove) {
                Image(systemName: "xmark.circle.fill")
                    .font(.caption)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.blue.opacity(0.1))
        .foregroundColor(.blue)
        .cornerRadius(16)
    }
}

struct SelectedTagView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedTagView(
            tag: Tag(id: 1, name: "Local & Neighborhood"),
            onRemove: {}
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
