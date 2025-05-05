//
//  MembersListView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct MembersListView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        CapsuleSearchBarThree()
                            .padding(.top, 15)
                        VStack(alignment: .leading) {
                            ForEach(0 ..< 15) { index in
                                NavigationLink {
                                    ProfileVisitorView(showBackButton: false, showNickname: true)
                                        .navigationBarBackButtonHidden()
                                } label: {
                                    HStack(spacing: 8) {
                                        Image("avatar")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50,height: 50)
                                            .clipShape(Circle())
                                        Text("Tess M")
                                            .font(.system(size: 18))
                                            .foregroundStyle(Color(.black))
                                    }
                                    .padding(.horizontal)
                                }
                            }
                            .padding(.vertical, 3)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MembersListView()
}
