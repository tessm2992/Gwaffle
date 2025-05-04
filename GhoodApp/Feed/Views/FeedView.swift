//
//  FeedView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct FeedView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @State private var selectedFeedFilter: FeedFilterOption = .sortDiscover
    @State private var selectedDropDown: FilterDropDownOption = .mostRecent
    @State private var isDropdownExpanded = false
    @State private var showMenu = false
    
    @StateObject private var viewModel = FeedViewModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    GeometryReader { proxy in
                            ZStack(alignment: .topTrailing) {
                                VStack(spacing: 0) {
                                    HStack {
                                        FeedFilter(selected: $selectedFeedFilter)
                                        Spacer()
                                        FilterDropDownButton(selected: $selectedDropDown, isExpanded: $isDropdownExpanded)
                                    }
                                    .padding(.vertical, 7)
                                    ScrollView {
                                        VStack {
                                            ForEach(0 ..< viewModel.threadposts.count, id: \.self) { index in
                                                ThreadPostView(viewModel: viewModel, index: index)
                                            }
                                        }
                                        .padding(.top)
                                        .frame(maxWidth: .infinity)
                                    }
                                }
                                if isDropdownExpanded {
                                    FilterDropDown(selected: $selectedDropDown, isExpanded: $isDropdownExpanded)
                                        .frame(width: 180)
                                        .offset(y: -7)
                                        .offset(x: 38)
                                        .transition(.opacity.combined(with: .move(edge: .top)))
                                        .animation(.easeInOut(duration: 0.2), value: isDropdownExpanded)
                                        .zIndex(1)
                                }
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            withAnimation {
                                showMenu.toggle()
                            }
                        } label: {
                            HStack(spacing: 1) {
                                Image(systemName: "line.3.horizontal")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 15, height: 15)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal,3)
                            }
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Threads")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundStyle(Color(.black))
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color(.black))
                    }
                }
                if showMenu {
                    Color.black.opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            withAnimation {
                                showMenu = false
                            }
                        }
                }
                
                // Side menu with proper positioning
                ZStack(alignment: .leading) {
                    if showMenu {
                        SideMenuView()
                            .frame(width: 270)
                            .transition(.move(edge: .leading))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .animation(.easeInOut, value: showMenu)
            }
        }
    }
}

    
#Preview {
    FeedView()
}


