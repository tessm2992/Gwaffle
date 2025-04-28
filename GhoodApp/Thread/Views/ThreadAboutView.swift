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
                            Text("About")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom, 3)
                            
                            Text(viewModel.threadposts[index].page?.pageAbout ?? "")
                                .font(.system(size: 15))
                                .foregroundStyle(Color(.black))
                            NavigationLink{
                                ThreadListView()
                                    .navigationBarBackButtonHidden()
                            } label: {
                                Text("Pop Culture")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.orange)
                                    .frame(height: 30)
                            }
                        }
                        .padding(.bottom)
                        
                        VStack(alignment: .leading) {
                            Text("Admins")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(.black))
                                .padding(.bottom, 3)
                            ForEach(0 ..< 2) { index in
                                NavigationLink {
                                    ProfileView(showBackButton: true)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    HStack {
                                        Image("avatar")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 20,height: 20)
                                            .clipShape(Circle())
                                        Text("tessm345")
                                            .font(.system(size: 15,weight: .semibold))
                                            .foregroundStyle(Color(.black))
                                    }
                                }
                            }
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
                                Image(systemName: "chevron.left")
                                    .foregroundStyle(Color(.black))
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
