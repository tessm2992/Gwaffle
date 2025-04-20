//
//  NotificationsCell.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct NotificationsCell: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink {
                DirectMessageView()
                    .navigationBarBackButtonHidden()
            } label: {
                HStack {
                    Image("avatar")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50,height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading,spacing: 0) {
                        Text("tessm345")
                            .font(.system(size: 17))
                            .foregroundStyle(Color(.black))
                        HStack {
                            Text("Are we still on for tonight?")
                                .font(.system(size: 17))
                                .foregroundStyle(Color(.systemGray))
                            Circle()
                                .frame(width: 2,height: 2)
                                .foregroundStyle(Color(.systemGray))
                        }
                    }
                    Spacer()
                    Text("2h")
                        .font(.system(size: 14))
                        .foregroundStyle(Color(.systemGray))
                    Circle()
                        .frame(width: 5,height: 5)
                        .foregroundColor(.red)
                }
            }
            .padding(.horizontal)
            .padding(.vertical,3)
        }
    }
}

#Preview {
    NotificationsCell()
}
