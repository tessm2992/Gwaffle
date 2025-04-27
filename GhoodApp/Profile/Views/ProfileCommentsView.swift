//
//  ProfileCommentsView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct ProfileCommentsView: View {
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<5) { _ in
                    Text("Comments will go here")
                    Divider()
                }
            }
        }
    }
}

#Preview {
    ProfileCommentsView()
}
