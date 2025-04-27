//
//  ExploreThreadsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct ExploreThreadsView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    @Environment(\.dismiss) private var dismiss
    
    let rows = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    CapsuleSearchBar()
                        .padding(.bottom,10)
                    NavigationLink {
                        CommunityExploreView()
                            .navigationBarBackButtonHidden()
                    } label: {
                        HStack {
                            Text("Pop Culture")
                                .font(.system(size: 20,weight: .semibold))
                                .foregroundStyle(Color(ghoodPink))
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundStyle(Color(ghoodPink))
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: rows, spacing: 16) {
                            ForEach(0 ..< 6) { index in
                                ThreadTileView(onFollow: {
                                    print("Followed thread \(index)")
                                })
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                }
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
                        Text("Explore Threads")
                            .foregroundStyle(Color(.black))
                            .fontWeight(.bold)
                    })
                }
            }
        }
    }
}

#Preview {
    ExploreThreadsView()
}
