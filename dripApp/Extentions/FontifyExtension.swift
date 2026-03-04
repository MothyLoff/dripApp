//
//  FontWork.swift
//  dripApp
//
//  Created by Тимофей Фролов on 19.02.2026.
//

import SwiftUI

extension View {
    func fontify(
        size: CGFloat = 20,
        weight: Font.Weight = .black
    ) -> some View {
        return self.font(
            .system(size: size, weight: weight)
            .width(.expanded)
        )
    }
    
    func fontify(
        _ style: FontifyStyle = .classTitle,
        color: Color? = nil,
        isExpanded: Bool = true
    ) -> some View {
        let size: CGFloat = switch style {
            case .roomNumber, .dayTitle: 32
            case .classTitle: 20
            case .classType: 12
            case .lecturerName: 16
            case .classTime, .classTimeActive: 12
        }
        let weight: Font.Weight = switch style {
            case .roomNumber, .dayTitle, .classTitle, .lecturerName, .classTimeActive: .black
            case .classType, .classTime: .semibold
        }
        let lineLimit: Int = switch style {
            case .lecturerName: 3
            case .classTitle: 2
            case .classTime, .classTimeActive, .classType, .dayTitle, .roomNumber: 1
        }
        let defaultColor: Color = switch style {
            case .classTime, .classType: .secondary
            default: .primary
        }
        
        return self
            .lineLimit(lineLimit)
            .foregroundStyle(color ?? defaultColor)
            .font(
                .system(size: size, weight: weight)
                .width(isExpanded ? .expanded : .standard)
            )
    }
}
