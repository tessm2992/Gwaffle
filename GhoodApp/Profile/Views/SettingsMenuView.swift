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
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("PREFERENCES")
                                .font(.system(size: 14,weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                            HStack {
                                Image(systemName: "bell")
                                    .frame(width: 24)
                                Text("Notifications")
                            }
                            HStack {
                                Image(systemName: "lock")
                                    .frame(width: 24)
                                Text("Privacy")
                            }
                        }
                        .padding(.horizontal)
                        
                        DividerView(width: proxy.size.width)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("SUPPORT")
                                .font(.system(size: 14,weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                            HStack {
                                Image(systemName: "gearshape")
                                    .frame(width: 24)
                                Text("Settings")
                            }
                            HStack {
                                Image(systemName: "shield.slash")
                                    .frame(width: 24)
                                Text("Blocked Users")
                            }
                            HStack {
                                Image(systemName: "questionmark.circle")
                                    .frame(width: 24)
                                Text("Help Center")
                            }
                            HStack {
                                Image(systemName: "arrowshape.turn.up.right")
                                    .frame(width: 24)
                                Text("Send Feedback")
                            }
                            HStack {
                                Image(systemName: "text.page")
                                    .frame(width: 24)
                                Text("Legal")
                            }
                        }
                        .padding(.horizontal)
                        
                        DividerView(width: proxy.size.width)
                        
                        VStack(alignment: .leading, spacing: 20) {
                            Text("ACCOUNT")
                                .font(.system(size: 14,weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                            HStack {
                                Image(systemName: "rectangle.portrait.and.arrow.right")
                                    .frame(width: 24)
                                Text("Logout")
                            }
                            .font(.system(size: 17,weight: .semibold))
                            HStack {
                                Image(systemName: "trash")
                                    .frame(width: 24)
                                Text("Delete Account")
                            }
                            .foregroundColor(.red)
                        }
                        .padding(.horizontal)
                    }
                    .foregroundStyle(Color(.black))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
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
