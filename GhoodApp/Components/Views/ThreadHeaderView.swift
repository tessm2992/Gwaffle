//
//  ThreadHeaderView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/16/25.
//

import SwiftUI

struct ThreadHeaderView: View {
    private var ghoodPink: Color = Color(red: 255/255, green: 41/255, blue: 91/255)
    private var ghoodLightPink: Color = Color(red: 255/255, green: 250/255, blue: 251/255)
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("threadpic")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40,height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading,spacing: 3) {
                    Text("g/summerhousebravo")
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundStyle(Color(ghoodPink))
                    Text("2.7k followers")
                        .font(.system(size: 14))
                        .foregroundStyle(Color(.systemGray))
                }
                Spacer()
                FollowButtonView()
            }
            .padding(.horizontal)
            Text("This is the description of the threads page. everything about the purpose of this thread will be here.")
                .font(.system(size: 14))
                .foregroundStyle(Color(.black))
                .padding(.horizontal)
                .padding(.top,1)
            HStack {
                Text("see more")
                    .font(.system(size: 14,weight: .semibold))
                    .foregroundStyle(Color(.black))
                    .padding(.horizontal)
                    .padding(.top,5)
                Text("Pop Culture")
                    .font(.system(size: 14,weight: .semibold))
                    .foregroundStyle(Color(ghoodPink))
                    .padding(.top,5)
            }
            
        }
    }
}

#Preview {
    ThreadHeaderView()
}
