//
//  SettingsMenuView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/27/25.
//

import SwiftUI

struct SettingsMenuView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showFeedbackSheet = false
    @State private var feedbackText = ""
    
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
                                Image(systemName: "shield.slash")
                                    .frame(width: 24)
                                Text("Blocked Users")
                            }
                            HStack {
                                Image(systemName: "questionmark.circle")
                                    .frame(width: 24)
                                Text("Help Center")
                            }
                            Button {
                                showFeedbackSheet = true
                            } label: {
                                HStack {
                                    Image(systemName: "arrowshape.turn.up.right")
                                        .frame(width: 24)
                                    Text("Send Feedback")
                                }
                                .foregroundStyle(Color(.black))
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
                                Image(systemName: "trash")
                                    .frame(width: 24)
                                Text("Delete Account")
                            }
                            .foregroundColor(.red)
                            Text("Log out")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundStyle(ghoodPink)
                                .frame(width: proxy.size.width - 30, height: 44)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(ghoodPink,lineWidth: 1)
                                }
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
                    Image(systemName: "chevron.left")
                        .foregroundStyle(Color(.black))
                })
            }
        }
        .sheet(isPresented: $showFeedbackSheet) {
            FeedbackSheetView(feedbackText: $feedbackText, isPresented: $showFeedbackSheet)
                .presentationDetents([.medium, .height(300)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    SettingsMenuView()
}
