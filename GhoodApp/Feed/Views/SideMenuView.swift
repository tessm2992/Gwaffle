//
//  SideMenuView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/22/25.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Home")
                .padding(.top, 100)
                .padding(.bottom, 20)
            Text("Profile")
                .padding(.vertical, 10)
            Text("Settings")
                .padding(.vertical, 10)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white) // Consider using your ghoodLightPink
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    SideMenuView()
}
