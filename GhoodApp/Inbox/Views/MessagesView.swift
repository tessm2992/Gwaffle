//
//  DMInboxView.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/20/25.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        ScrollView {
            VStack {
                InboxSearchBar()
                ForEach(0..<10) { _ in
                    MessagesCell()
                    Divider()
                }
            }
        }
    }
}

#Preview {
    MessagesView()
}
