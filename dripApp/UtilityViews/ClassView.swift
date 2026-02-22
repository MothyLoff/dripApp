//
//  ClassView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 22.02.2026.
//

import SwiftUI
import SchedHSE

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif


struct ClassView: View {
    
    let classItem: ClassItem
    @Binding var isExpanded: Bool
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(classItem.discipline)
                    .fontify(.classTitle)
                    .fixedSize(horizontal: false, vertical: true)
                Text(classItem.kindOfWork)
                    .fontify(.classType)
                
                Spacer()
                
                if isExpanded {
                    VStack(alignment: .leading) {
                        ForEach(classItem.listOfLecturers) { i in
                            LecturerView(lecturer: i)
                        }
                        Spacer()
//                        Text(classItem.group)
//                            .fontify(.classTime)
                    }
                    .transition(.transify)
                }
                
                Text(RoomNumber(classItem.auditorium).stringNumber)
                    .fontify(
                        .roomNumber,
                        color:
                            Color.secondarySystemBackground
                            
                    )
                    .cardView(
                        style: .roomNumber,
                        background: .primary
                    )
            }
            
            Spacer()
            VStack(alignment: .trailing) {
                if isExpanded {
                    Text(String(classItem.lessonNumberStart))
                        .fontify(.classTitle)
                        .frame(width: 30, height: 30, alignment: .bottomLeading)
                        .transition(.transify)
                    Spacer()
                }
                
                Text(classItem.beginLesson.timeHHmm)
                    .fontify(.classTime)
                    .padding(.trailing, 2)
                    .padding(.vertical, 2)
                
                if !isExpanded { Spacer() }
                
                Text(classItem.endLesson.timeHHmm)
                    .fontify(.classTime)
                    .padding(.trailing, 2)
                    .padding(.vertical, 2)
            }
            .frame(width: 50, alignment: .trailing)
        }
        .cardView(style: .cardView)
        .frame(minHeight: 150)
        .padding(.horizontal)
    }
}


#Preview {
    ScrollView {
        LazyVStack(spacing: 30) {
            try! DayModelView(classList: [
                MockData.classItem,
                MockData.classItem
            ])
            try! DayModelView(classList: [
                MockData.classItem1,
                MockData.classItem2
            ])
        }
    }
}

