//
//  SettingsMenuView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct SettingsMenuView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack {
                            Image(systemName: "gearshape")
                                .frame(width: 24)
                            Text("Settings")
                        }
                        HStack {
                            Image(systemName: "questionmark.circle")
                                .frame(width: 24)
                            Text("Help Center")
                        }
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .frame(width: 24)
                            Text("Sign Out")
                        }
                    }
                    .foregroundStyle(Color(ghoodPink))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
        }
        .scrollIndicators(.hidden)
        .toolbar{
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color(ghoodPink))
                })
            }
        }
    }
}

#Preview {
    SettingsMenuView()
}
