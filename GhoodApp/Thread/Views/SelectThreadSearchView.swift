//
//  SelectThreadSearchView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 5/3/25.
//

import SwiftUI

struct SelectThreadSearchView: View {
    
    var body: some View {
        HStack {
            Image("threadpic")
                .resizable()
                .scaledToFill()
                .frame(width: 40,height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack(alignment: .leading) {
                Text("g/summerhousebravo")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
                Text("2.7k followers")
                        .font(.system(size: 12))
                        .foregroundStyle(Color(.systemGray))
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

#Preview {
    SelectThreadSearchView()
}
