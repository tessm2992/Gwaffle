//
//  BadgeTag.swift
//  GhoodApp
//
//  Created by Tess Munsie on 4/17/25.
//

import SwiftUI

enum ThreadBadge: String, CaseIterable {
    case paige = "Paige"
    case craig = "Craig"
    case newCast = "New Castmates"
  
}
extension ThreadBadge {
    var color: Color {
        switch self {
        case .paige: return Color(red: 0/255, green: 212/255, blue: 187/255)
        case .craig: return Color(red: 255/255, green: 177/255, blue: 0/255)
        case .newCast: return Color(red: 146/255, green: 226/255, blue: 52/255)
        }
    }
}
struct BadgeTag: View {
    let badge: ThreadBadge

    var body: some View {
        Text(badge.rawValue)
            .font(.system(size: 12, weight: .semibold))
            .padding(.vertical, 3)
            .padding(.horizontal, 10)
            .background(
                Capsule()
                    .fill(badge.color)
            )
            .foregroundColor(.white)
    }
}


#Preview {
    BadgeTag(badge: .paige)
}
