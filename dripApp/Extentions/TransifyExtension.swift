//
//  TransifyExtension.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

import SwiftUI

internal extension AnyTransition {
    static var transify: AnyTransition {
        .modifier(
            active: transifyModifier(
                scale: 0.3,
                opacity: 0,
                blur: 30
            ),
            identity: transifyModifier(
                scale: 1,
                opacity: 1,
                blur: 0,
            )
        )
    }
}

fileprivate struct transifyModifier: ViewModifier {
    let scale: CGFloat
    let opacity: CGFloat
    let blur: CGFloat
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(self.scale)
            .blur(radius: self.blur)
            .opacity(self.opacity)
    }
}

internal extension Animation {
    static var springify: Animation {
        .spring(response: 0.5, dampingFraction: 0.73)
    }
}
