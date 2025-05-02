//
//  TagSelectorViewModel.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import Foundation
import Combine

class TagSelectorViewModel: ObservableObject {
    // Available tags
    let availableTags: [Tag] = [
        Tag(id: 1, name: "Local"),
        Tag(id: 2, name: "Social"),
        Tag(id: 3, name: "Support"),
        Tag(id: 4, name: "Interest-based"),
        Tag(id: 5, name: "Professional"),
        Tag(id: 6, name: "Activism"),
        Tag(id: 7, name: "Creator Community")
    ]
    
    // Selected tags
    @Published var selectedTags: Set<Tag> = []
    
    // Toggle tag selection
    func toggleTag(_ tag: Tag) {
        if selectedTags.contains(tag) {
            selectedTags.remove(tag)
        } else {
            selectedTags.insert(tag)
        }
    }
    
    // Handle form submission
    func createCommunity() {
        print("Creating community with tags: \(selectedTags)")
        // Add your API call or data persistence logic here
    }
}
