//
//  SwiftUIView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct CreatePostView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Button(action:{}, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(ghoodPink)
                                .fontWeight(.bold)
                        })
                        Text("Create Post")
                        
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {}, label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 80,height: 35)
                            .foregroundStyle(Color(.darkGray))
                            .background(Color(.systemGray5))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    })
                }
            }
        }
    }
}

#Preview {
    CreatePostView()
}
