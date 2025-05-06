//
//  RootView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/6/25.
//

import SwiftUI

struct RootView: View {
    @State private var isLoading = true

    var body: some View {
        Group {
            if isLoading {
                LoadScreenView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // Simulate loading time
                isLoading = false
            }
        }
    }
}

#Preview {
    RootView()
}
