//
//  ClassView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

import Foundation
import SwiftUI
import SchedHSE


struct ClassViewT1: View {
    
    let classItem: ClassItem
    
    @Binding var isExpanded: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(classItem.discipline)
                        .fontify(.classTitle)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(classItem.kindOfWork)
                        .fontify(.classType)
                }
                .frame(width: 270, alignment: .leading)
                .frame(minHeight: 70, alignment: .top)
                
                if isExpanded {
                    VStack {
                        ForEach(classItem.listOfLecturers) { i in
                            LecturerView(lecturer: i)
                        }
                    }
                    .transition(.transify)
                }
                
                Text(classItem.auditorium)
                    .fontify(
                        .roomNumber,
                        color: Color(UIColor.secondarySystemBackground)
                    )
                    .cardView(
                        style: .roomNumber,
                        background: .primary
                    )
            }
            Spacer()
            VStack {
                Rectangle()
                    .frame(width: 50)
            }
        }
        .cardView(
            style: .cardView,
            background: .background.secondary
        )
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
    .preferredColorScheme(.light)
}
