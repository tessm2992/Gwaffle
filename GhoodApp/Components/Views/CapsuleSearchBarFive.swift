//
//  CapsuleSearchBarFive.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/4/25.
//

import SwiftUI

struct CapsuleSearchBarFive: View {
    @State private var searchText = ""
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(ghoodPink.opacity(0.7))

            TextField("Search polls", text: $searchText)
                .foregroundStyle(Color(.black))
                .font(.system(size: 14))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 10)
        .background(Color(ghoodPink.opacity(0.06)))
        .clipShape(Capsule())
        .padding(.horizontal)
    }
}

#Preview {
    CapsuleSearchBarFive()
}
