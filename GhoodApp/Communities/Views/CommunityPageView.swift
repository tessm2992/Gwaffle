//
//  CommunityPageView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CommunityPageView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        ScrollView {
            Text("Hello!")
        }
        .scrollIndicators(.hidden)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action:{}, label: {
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

#Preview {
    CommunityPageView()
}
