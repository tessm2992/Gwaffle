//
//  ProfileView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct ThreadView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                ThreadHeaderView()
                DividerThinView(width: proxy.size.width - 15)
                ForEach(0..<2) { _ in
                    ThreadPostOtherView()
                    DividerThinView(width: proxy.size.width - 15)
                }
                
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Threads")
            .foregroundStyle(Color(.systemGray5))
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(Color(ghoodPink))
                            .fontWeight(.bold)
                    })
                }
                
            }
        }
    }
}


#Preview {
    ThreadView()
}


