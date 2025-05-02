//
//  CreateCommunityButtonView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct CreateCommunityButtonView: View {
    let onCreateTapped: () -> Void
    
    var body: some View {
        Button(action: onCreateTapped) {
            Text("Create Community")
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
        }
    }
}

struct CreateCommunityButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCommunityButtonView(onCreateTapped: {})
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
