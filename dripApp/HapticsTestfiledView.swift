//
//  HapticsTestfiledView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

import SwiftUI
import SchedHSE
import Foundation


struct HapticsManagerPreview: View {
    
    var body: some View {
        VStack(spacing: 40) {
            Button("success") { HapticsManager.instance.notification(type: .success) }
            Button("warning") { HapticsManager.instance.notification(type: .warning) }
            Button("error") { HapticsManager.instance.notification(type: .error) }
            Divider()
            Button("soft") { HapticsManager.instance.impact(style: .soft) }
            Button("light") { HapticsManager.instance.impact(style: .light) }
            Button("medium") { HapticsManager.instance.impact(style: .medium) }
            Button("rigid") { HapticsManager.instance.impact(style: .rigid) }
            Button("heavy") { HapticsManager.instance.impact(style: .heavy) }
        }
        .fontify()
    }
}

//struct HapticChoose: View {
//    
//    static let calendar: Calendar = .current
//    
//    static let cI = ClassItem(
//        tableofLessonsName: "1",
//        contentOfLoadFaculty: "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771",
//        parentschedule: "1 курс ДРИП 25/26 ",
//        building: "Покровский б-р, д.11",
//        auditorium: "R406",
//        dayOfWeek: 6,
//        contentTableOfLessonsName: 4,
//        beginLesson: calendar.date(
//            from: DateComponents(calendar: calendar, year: 2026, month: 2, day: 20, hour: 14, minute: 40)
//        )!,
//        endLesson: calendar.date(
//            from: DateComponents(calendar: calendar, year: 2026, month: 2, day: 20, hour: 16, minute: 00)
//        )!,
//        lessonNumberEnd: 4,
//        lessonNumberStart: 4,
//        group: "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771",
//        discipline: "Линейная алгебра и геометрия (рус)",
//        kindOfWork: "Лекция",
//        listOfLecturers: [
//            Lecturer(
//                lecturer: "Лопаткин Виктор Евгеньевич",
//                lecturerEmail: "vlopatkin@hse.ru",
//                lecturerOid: 12591,
//                lecturer_rank: "Доцент",
//                lecturer_title: "Лопаткин Виктор Евгеньевич"
//            )
//        ]
//    )
//    
//    var body: some View {
//        ScrollView {
//            LazyVStack {
//                ClassView(
//                    impactStyle: .soft,
//                    classItem: Self.cI
//                )
//                ClassView(
//                    impactStyle: .light,
//                    classItem: Self.cI
//                )
//                
//            }
//            .padding(.horizontal, 20)
//            
//        }
//    }
//}


#Preview {
    HapticsManagerPreview()
        .preferredColorScheme(.dark)
}

