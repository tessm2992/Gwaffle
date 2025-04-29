//
//  ThreadListView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct ThreadListView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)

    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    CapsuleSearchBarFour()
                        .padding(.bottom,10)
                    ForEach(0 ..< 8) { index in
                        ThreadTileOtherView(onFollow: { print("Followed!")})
                            .padding(.bottom,6)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(Color(.black))
                    })
                }
                ToolbarItem(placement: .principal) {
                    Button(action: {dismiss()}, label: {
                        Text("Pop Culture")
                            .foregroundStyle(Color(.black))
                            .font(.system(size: 17,weight: .semibold))
                    })
                }
            }
        }
    }
}

#Preview {
    ThreadListView()
}
