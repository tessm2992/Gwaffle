//
//  CommunityDiscoverView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/23/25.
//

import SwiftUI

struct CommunityDiscoverView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    Text("Tiles for different communities related to this category!")
                        .foregroundStyle(Color(ghoodPink))
                }
                .scrollIndicators(.hidden)
                .foregroundStyle(Color(.systemGray5))
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {dismiss()}, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(Color(ghoodPink))
                                .fontWeight(.bold)
                        })
                    }
                    ToolbarItem(placement: .principal) {
                        Button(action: {dismiss()}, label: {
                            Text("Local & Neighborhood")
                                .foregroundStyle(Color(ghoodPink))
                                .fontWeight(.bold)
                        })
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {}, label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color(ghoodPink))
                                .fontWeight(.bold)
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    CommunityDiscoverView()
}
