//
//  TagItemView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

// Changed from protocol to struct with associated type
protocol TagItemView: View {
    var id: Int { get }
}
