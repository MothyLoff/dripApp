//
//  ClassView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

import Foundation
import SwiftUI
import SchedHSE


struct ClassView_01: View {
    
    let classItem: ClassItem
    
    @Binding var isExpanded: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(classItem.discipline)
                        .fontify(.classTitle)
                    Text(classItem.kindOfWork)
                        .fontify(.classType)
                }
                
                if isExpanded { Spacer().frame(height: 10) }
                
                Spacer()
                
                if isExpanded {
                    VStack {
                        ForEach(classItem.listOfLecturers) { i in
                            LecturerView(lecturer: i)
                        }
                        Spacer()
                    }
                    .transition(.transify)
                }
                
                if isExpanded {
                    Spacer().frame(height: 10)
                }
                
                Text(RoomNumber(classItem.auditorium).stringNumber)
                    .fontify(
                        .roomNumber,
                        color: Color.systemBackground
                    )
                    .cardView(style: .roomNumber, background: .primary)
                
            }
            Spacer()
            VStack(
                alignment: .trailing,
                spacing: 0
            ) {
//                if isExpanded {
//                    Text(String(classItem.lessonNumberStart))
//                        .fontify(.classTitle)
//                        .transition(.transify)
//                        .frame(width: 30, height: 30, alignment: .bottomLeading)
//                    Spacer()
//                }
                
                Text(classItem.beginLesson.timeHHmm)
                    .padding(.trailing, 4)
                    .padding(.vertical, 4)
                
                if !isExpanded { Spacer() }
                
                Text(classItem.endLesson.timeHHmm)
                    .padding(.trailing, 4)
                    .padding(.vertical, 4)
            }
            .fontify(.classTime)
        }
        .cardView(
            style: .cardView,
            background: .background.secondary
        )
        .frame(minHeight: 150)
        .padding(.horizontal)
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
