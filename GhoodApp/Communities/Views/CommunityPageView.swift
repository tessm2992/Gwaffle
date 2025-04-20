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
    @State private var groupName: String = "Tinx's Army"
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @State private var selectedFeedFilter: FeedFilterOption = .sortDiscover
    @State private var selectedDropDown: FilterDropDownOption = .mostRecent
    @State private var isDropdownExpanded = false
    
    var topSafeAreaInset: CGFloat {
        UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first?.safeAreaInsets.top ?? 44
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            // Main scroll view with content
            ScrollViewReader { scrollProxy in
                ScrollView {
                    // Scroll position tracker
                    OffsetTrackingView(offset: $scrollOffset)
                        .frame(height: 0)
                    
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
                        VStack {
                            VStack(spacing: 10) {
                                CommunityHeader(groupName: $groupName)
                                DividerView(width: UIScreen.main.bounds.width - 5)
                                CreateCommunityPost()
                                DividerView(width: UIScreen.main.bounds.width - 5)
                            }
                            .padding(.top, 16)
                            HStack {
                                FilterDropDownButton(selected: $selectedDropDown, isExpanded: $isDropdownExpanded)
                                Spacer()
                            }
                            VStack(spacing: 0) {
                                ForEach(0..<4) { _ in
                                    CommunityPost()
                                    DividerView(width: UIScreen.main.bounds.width - 5)
                                }
                            }
                            .padding(.top, -10)
                        }
                    }
                }
            }
            
            // filter drop down
            if isDropdownExpanded {
                FilterDropDown(selected: $selectedDropDown, isExpanded: $isDropdownExpanded)
                    .frame(width: 180)
                    .offset(y: 250)
                    .offset(x: 0)
                    .transition(.opacity.combined(with: .move(edge: .top)))
                    .animation(.easeInOut(duration: 0.2), value: isDropdownExpanded)
                    .zIndex(1)
            }
            
            // Fixed top nav bar that changes appearance on scroll
            StickyNavBar(
                coverImage: coverImage,
                groupName: groupName,
                topInset: topSafeAreaInset,
                showHeaderInfo: showHeaderInfo,
                ghoodPink: ghoodPink
            )
        }
        .ignoresSafeArea(edges: .top)
        .onChange(of: selectedItem) {
            Task {
                if let data = try? await selectedItem?.loadTransferable(type: Data.self),
                   let uiImage = UIImage(data: data) {
                    coverImage = uiImage
                    imageOffset = .zero
                }
            }
        }
        .onChange(of: scrollOffset) { oldValue, newValue in
            // Create a threshold for showing the header info
            withAnimation(.easeInOut(duration: 0.2)) {
                showHeaderInfo = newValue > 150
            }
            print("Scroll offset: \(newValue), Show header: \(showHeaderInfo)")
        }
    }
}

// Create a dedicated view to track scroll offset
struct OffsetTrackingView: View {
    @Binding var offset: CGFloat
    
    var body: some View {
        GeometryReader { geo in
            Color.clear
                .preference(key: OffsetPreferenceKey.self, value: geo.frame(in: .global).minY)
                .onPreferenceChange(OffsetPreferenceKey.self) { value in
                    offset = -value
                }
        }
    }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}



#Preview {
    CommunityPageView()
}


