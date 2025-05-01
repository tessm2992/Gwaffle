//
//  ProfileVisitorView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/1/25.
//

import SwiftUI

struct ProfileVisitorView: View {
    var showBackButton: Bool = false
    var showNickname: Bool // Flag to decide whether to show nickname or username
    @State private var username: String = "@tessm345" // Replace with actual user data
    @State private var nickname: String = "Tess M" // Replace with actual user data
    
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    @State private var tabOffset: CGFloat = 0
    @State private var pinned = false
    @Environment(\.dismiss) private var dismiss
    @State private var showActionSheet = false
    @State private var privacySetting: Bool = true // Assume private content by default
    
    init(showBackButton: Bool = false, showNickname: Bool) {
       self.showBackButton = showBackButton
       self.showNickname = showNickname
   }
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack {
                        HStack {
                            Spacer()
                            VStack(spacing: 13) {
                                Image("avatar")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 110, height: 110)
                                    .clipShape(Circle())
                                Text(showNickname ? nickname : username)
                                    .font(.system(size: 25, weight: .bold))
                                    .foregroundStyle(Color(.black))
                                HStack {
                                    Text("28 y/o")
                                    Circle()
                                        .frame(width: 3, height: 3)
                                    Text("Seattle, WA")
                                }
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                                NavigationLink {
                                    DirectMessageView()
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    Text("Send message")
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                        .frame(width: 170, height: 40)
                                        .background(Color(ghoodPink))
                                        .clipShape(RoundedRectangle(cornerRadius: 30))
                                }
                                .padding(.top, 10)
                            }
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                        // Conditionally show SwipeableTabsView based on privacySetting
                        if !privacySetting {
                            SwipeableTabsView()
                        } else {
                            Text("This content is private.")
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundStyle(Color(.systemGray))
                                .padding()
                        }
                    }
                    .scrollIndicators(.hidden)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                showActionSheet.toggle()
                            }) {
                                Image(systemName: "ellipsis")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 4, height: 4)
                                    .foregroundStyle(.black)
                                    .padding(.horizontal, 10)
                            }
                            .actionSheet(isPresented: $showActionSheet) {
                                ActionSheet(
                                    title: Text("Options"),
                                    buttons: [
                                        .destructive(Text("Report User")) {
                                            // Handle Report action
                                        },
                                        .destructive(Text("Block User")) {
                                            // Handle Block action
                                        },
                                        .cancel()
                                    ]
                                )
                            }
                        }
                        if showBackButton {
                            ToolbarItem(placement: .topBarLeading) {
                                Button(action: { dismiss() }, label: {
                                    Image(systemName: "chevron.left")
                                        .foregroundStyle(Color(.black))
                                })
                            }
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    ProfileVisitorView(showBackButton: false, showNickname: false)
}
