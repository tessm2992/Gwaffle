//
//  ThreadView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct ThreadView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = FeedViewModel()
    private var index: Int
    
    init(viewModel: FeedViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack{
                    ThreadHeaderView(viewModel: viewModel, index: index)
                    DividerView(width: proxy.size.width)
                    CreateThreadPostTileView()
                    DividerView(width: proxy.size.width)
                    ForEach(0..<viewModel.threadposts.count, id: \.self) { index in
                        ThreadPostOtherView(viewModel: viewModel, index: index)
                    }
                    .padding(.vertical, 0)
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Threads")
                .foregroundStyle(Color(ghoodPink))
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color(.black))
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color(.black))
                    })
                }
                
            }
        }
    }
}


#Preview {
    ThreadView(viewModel: FeedViewModel(), index: 0)
}


