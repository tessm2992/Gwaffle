//
//  MembersRequestView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/2/25.
//

import SwiftUI

struct MembersRequestView: View {
    var body: some View {
        ForEach(0 ..< 2) { index in
            NavigationLink {
                ProfileVisitorView(showBackButton: false, showNickname: true)
            } label: {
                HStack {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                        .clipShape(Circle())
                    Text("tessm345")
                        .font(.system(size: 15))
                        .foregroundStyle(Color(.black))
                }
            }
        }
    }
}

#Preview {
    MembersRequestView()
}
