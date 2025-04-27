//
//  SettingsMenuView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct SettingsMenuView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image(systemName: "gearshape")
                    .frame(width: 24)
                Text("Settings")
                    .padding(.vertical, 10)
            }
            HStack {
                Image(systemName: "questionmark.circle")
                    .frame(width: 24)
                Text("Help Center")
                    .padding(.vertical, 10)
            }
            HStack {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .frame(width: 24)
                Text("Sign Out")
                    .padding(.vertical, 10)
            }
        }
        .foregroundStyle(Color(ghoodPink))
        .padding(.bottom,100)
    }
}

#Preview {
    SettingsMenuView()
}
