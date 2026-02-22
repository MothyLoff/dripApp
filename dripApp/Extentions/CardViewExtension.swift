//
//  CardViewExtention.swift
//  dripApp
//
//  Created by Тимофей Фролов on 19.02.2026.
//

import SwiftUI

extension View {
    func cardView<S: ShapeStyle>(
        style: CardStyle,
        background: S = .background.secondary
    ) -> some View {
        let cornerRadius: CGFloat = style.rawValue
        let paddings: (h: CGFloat, v: CGFloat) = switch style {
        case .cardView: (h: 16, v: 16)
        case .roomNumber: (h: 12, v: 4)
        }
        return self
            .padding(.horizontal, paddings.h)
            .padding(.vertical, paddings.v)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(background)
            )
    }
}

//#Preview {
//    LazyVStack {
//        ClassView(classItem: MockData.classItem)
//        ClassView(classItem: MockData.classItem)
//        ClassView(classItem: MockData.classItem)
//    }
//    .padding(.horizontal, 20)
//}
