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
            ScrollView {
                VStack(spacing: 10) {
                    CapsuleSearchBarFour()
                        .padding(.bottom,10)
                    ForEach(0 ..< 8) { index in
                        ExploreThreadCategoriesView()
                            .padding(.bottom,10)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color(ghoodPink))
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
