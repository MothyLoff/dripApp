//
//  ScheduleItem.swift
//  dripApp
//
//  Created by Тимофей Фролов on 21.02.2026.
//

import SwiftUI
import SchedHSE


struct ScheduleItemView: View {
    
    let classList: [ClassItem]
    
    // TODO: --- toggle isExpanded back
    @State private var isExpanded: Bool = false
    @State private var itemIndex: Int? = 0
    
    var body: some View {
        if classList.count == 1 {
            ClassView(classItem: classList[0], isExpanded: $isExpanded)
                .onTapGesture {
                    withAnimation(.springify) {
                        self.isExpanded.toggle()
                        #if os(iOS)
                            HapticsManager.instance.impact(style: .soft)
                        #endif
                    }
                }
        } else {
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(classList.indices, id: \.self) { i in
                            ClassView(
                                classItem: classList[i],
                                isExpanded: $isExpanded
                            )
                            .id(i)
                            .containerRelativeFrame(
                                .horizontal,
                                count: 1,
                                span: 1,
                                spacing: 0,
                            )
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollClipDisabled()
                .scrollTargetBehavior(.paging)
                .scrollPosition(id: $itemIndex)
                
                VStack {
                    Spacer()
                    HStack {
                        ForEach(classList.indices, id: \.self) { i in
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(
                                    (i == (itemIndex ?? -1))
                                    ? .primary
                                    : .secondary
                                )
                        }
                        
                    }
                    .padding(.bottom, 8)
                }
            }
            .onTapGesture {
                withAnimation(.springify) {
                    self.isExpanded.toggle()
                    #if os(iOS)
                        HapticsManager.instance.impact(style: .soft)
                    #endif
                }
            }
        }
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 10) {
            ScheduleItemView(classList: [
                MockData.classItem
            ])
            ScheduleItemView(classList: [
                MockData.classItem,
                MockData.classItem,
                MockData.classItem
            ])
            
        }
    }
    .preferredColorScheme(.dark)
}
