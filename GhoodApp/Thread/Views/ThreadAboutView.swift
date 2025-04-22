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
                        VStack(alignment: .leading) {
                            Text("Description")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom, 3)
                            
                            Text(viewModel.threadposts[index].page?.pageAbout ?? "")
                                .font(.system(size: 15))
                                .foregroundStyle(Color(.black))
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("Rules")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom, 3)
                            Text("List of rules")
                                .font(.system(size: 15))
                                .foregroundStyle(Color(.black))
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("Moderators")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom, 3)
                            Text("List of moderators")
                                .font(.system(size: 15))
                                .foregroundStyle(Color(.black))
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                    .padding(.top, 0)
                    .frame(maxWidth: .infinity, alignment: .leading)
                   
                    Spacer()
                    
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
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    ThreadAboutView(viewModel: FeedViewModel(), index: 0)
}
