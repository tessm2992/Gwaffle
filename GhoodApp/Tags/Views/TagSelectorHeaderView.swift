//
//  TagSelectorHeaderView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct TagSelectorHeaderView: View {
    var body: some View {
        Text("COMMUNITY TYPE (Select all that apply)")
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(Color(.systemGray))
            .padding(.bottom, 4)
    }
}



#Preview {
    TagSelectorHeaderView()
}
