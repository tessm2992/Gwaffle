//
//  CommunityPageView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CommunityPageView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @Environment(\.dismiss) private var dismiss
    @State private var isAdmin = true
    @State private var coverImage: UIImage? = nil
    @State private var imageOffset: CGSize = .zero
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    VStack {
                        if isAdmin {
                            EditableCoverBanner(
                                image: $coverImage,
                                imageOffset: $imageOffset,
                                onSave: {
                    
                                }
                            )
                        } else {
                            StaticCoverBanner(image: coverImage, imageOffset: imageOffset)
                        }
                    }
                }
                CommunityHeader()
                    .padding(.top,15)
                DividerView(width: proxy.size.width - 15)
                CreateCommunityPost()
                DividerView(width: proxy.size.width - 15)
                VStack {
                    ForEach(0 ..< 3, id:\.self) { _ in
                        CommunityPost()
                        DividerThinView(width: proxy.size.width - 15)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action:{dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(ghoodPink)
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action:{}, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(ghoodPink)
                            .fontWeight(.bold)
                    })
                }
            }
        }
    }
}

#Preview {
    CommunityPageView()
}
