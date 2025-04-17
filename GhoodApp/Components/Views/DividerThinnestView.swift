//
//  DividerThinnestView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

struct DividerThinnestView: View {
    private var width: CGFloat
    init(width: CGFloat) {
        self.width = width
    }
    var body: some View {
        Rectangle()
            .foregroundStyle(Color(.systemGray5))
            .frame(width: width,height: 0.5)
    }
}
