//
//  HapticsManagerClass.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

#if os(iOS)
import SwiftUI

class HapticsManager {
    
    static let instance: HapticsManager = .init()
    
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}
#endif
