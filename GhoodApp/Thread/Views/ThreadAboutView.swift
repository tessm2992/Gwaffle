//
//  ThreadAboutView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct ThreadAboutView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = FeedViewModel()
    private var index: Int
    
    init(viewModel: FeedViewModel, index: Int) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
    }
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("About")
                            .font(.system(size: 20))
                            .foregroundStyle(Color(.black))
                        Text(viewModel.threadposts[index].page?.pageAbout ?? "")
                            .font(.system(size: 20))
                            .foregroundStyle(Color(.black))
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
                            Text(viewModel.threadposts[index].page?.pageTitle ?? "")
                                .foregroundStyle(Color(ghoodPink))
                                .font(.system(size: 17,weight: .semibold))
                            }
                        }
                    }
                }
            }
        }
    }

#Preview {
    ThreadAboutView(viewModel: FeedViewModel(), index: 0)
}
