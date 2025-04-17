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
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ZStack {
                    ghoodLightPink.ignoresSafeArea()
                    ScrollView {
                        VStack {
                            ForEach(0 ..< 3, id:\.self) { _ in
                                ThreadPostView()
                                DividerView(width: proxy.size.width - 15)
                            }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                HStack(spacing: 1) {
                                    Image(systemName: "line.3.horizontal")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 15, height: 15)
                                        .foregroundStyle(ghoodPink)
                                    Image("ghoodlogo")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 170, height: 170)
                                        .foregroundStyle(ghoodPink)
                                }
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                HStack(spacing: 24) {
                                    Image(systemName: "magnifyingglass")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(ghoodPink)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
    
#Preview {
    FeedView()
}



