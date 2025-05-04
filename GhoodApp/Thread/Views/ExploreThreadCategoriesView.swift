//
//  ExploreThreadCategoriesView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct ExploreThreadCategoriesView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    @Environment(\.dismiss) private var dismiss
    
    let rows = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    
    var body: some View {
        NavigationStack {
                ScrollView {
                    NavigationLink {
                        ThreadListView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack {
                            Text("Pop Culture")
                                .font(.system(size: 15,weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                                .textCase(.uppercase)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color(.systemGray))
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, -3)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, spacing: 16) {
                            ForEach(0 ..< 6) { index in
                                ThreadTileView(
                                    onFollow: {
                                        print("Follow button tapped")
                                    }
                                )
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ExploreThreadCategoriesView()
}

