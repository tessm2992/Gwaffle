//
//  DividerView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI


struct DividerView: View {
    private var width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(ghoodPink.opacity(0.1)))
            .frame(width: width,height: 4)
    }
}


