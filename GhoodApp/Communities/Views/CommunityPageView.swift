//
//  CommunityPageView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI
import PhotosUI

struct CommunityPageView: View {
    @State private var coverImage: UIImage? = UIImage(named: "TinxCoverPhoto")
    @State private var imageOffset: CGSize = .zero
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var scrollOffset: CGFloat = 0
    @State private var showHeaderInfo: Bool = false

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                GeometryReader { proxy in
                    ScrollView {
                        VStack(spacing: 0) {
                            
                            // Parallax header
                            GeometryReader { imageGeo in
                                let y = imageGeo.frame(in: .global).minY
                                
                                ParallaxEditableHeader(
                                    image: $coverImage,
                                    imageOffset: $imageOffset,
                                    selectedItem: $selectedItem,
                                    height: 250
                                )
                                .offset(y: y > 0 ? -y : 0)
                                .frame(height: max(250 + (y > 0 ? y : 0), 250))
                            }
                            .frame(height: 250)
                            
                            // Main content
                            VStack(spacing: 16) {
                                CommunityHeader()
                                DividerView(width: proxy.size.width - 15)
                                CreateCommunityPost()
                                DividerView(width: proxy.size.width - 15)
                                VStack {
                                    ForEach(0..<4) { _ in
                                        CommunityPost()
                                        DividerView(width: proxy.size.width - 15)
                                    }
                                }
                            }
                            .padding(.top, 16)
                        }
                        .background(
                            GeometryReader {
                                Color.clear.preference(
                                    key: ScrollOffsetKey.self,
                                    value: $0.frame(in: .global).minY
                                )
                            }
                        )
                    }
                }

                // Top sticky nav bar
                VStack {
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(showHeaderInfo ? .black : ghoodPink)
                        }

                        Spacer()

                        if showHeaderInfo {
                            HStack(spacing: 8) {
                                Image(uiImage: coverImage ?? UIImage())
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .clipShape(Circle())
                                Text("Group Name")
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                        }

                        Spacer()

                        Button(action: {}) {
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(showHeaderInfo ? .black : ghoodPink)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .frame(height: 44)
                    .background(
                        (showHeaderInfo ? Color.white : Color.clear)
                            .animation(.easeInOut(duration: 0.25), value: showHeaderInfo)
                    )
                    .shadow(color: showHeaderInfo ? .black.opacity(0.05) : .clear, radius: 4, y: 2)
                }
            }
            .ignoresSafeArea(edges: .top)
            .onPreferenceChange(ScrollOffsetKey.self) { value in
                let newOffset = -value
                scrollOffset = newOffset
                withAnimation(.easeInOut(duration: 0.2)) {
                    showHeaderInfo = newOffset > 200
                }
            }
            .onChange(of: selectedItem) {
                Task {
                    if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        coverImage = uiImage
                        imageOffset = .zero
                    }
                }
            }
        }
    }
}

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}



#Preview {
    CommunityPageView()
}
