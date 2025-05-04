//
//  InboxSearchBar.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct InboxSearchBar: View {
    @State private var searchText = ""
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        HStack(alignment: .top) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(ghoodPink.opacity(0.7))
                
              
                TextField("Search messages", text: $searchText)
                    .foregroundStyle(Color(.black))
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color(ghoodPink.opacity(0.06)))
            .clipShape(Capsule())
            NavigationLink {
                NewDirectMessageView()
                    .navigationBarBackButtonHidden()
            } label: {
                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 24, height: 24)
                    .padding(.vertical, 3)
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}

#Preview {
    InboxSearchBar()
}
