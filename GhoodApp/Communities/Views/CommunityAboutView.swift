//
//  CommunityAboutView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/18/25.
//

import SwiftUI

struct CommunityAboutView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(alignment: .leading) {
                    Text("About")
                        .font(.system(size: 20))
                        .foregroundStyle(Color(.black))
                    Text("this is context on the community etc")
                        .font(.system(size: 20))
                        .foregroundStyle(Color(.black))
                }
                
                .scrollIndicators(.hidden)
                .navigationTitle("Tinx's Army")
                .foregroundStyle(Color(.systemGray5))
                .toolbar{
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {dismiss()}, label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(Color(ghoodPink))
                                .fontWeight(.bold)
                        })
                    }
                    
                }
            }
        }
    }
}

#Preview {
    CommunityAboutView()
}
