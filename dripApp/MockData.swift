//
//  MockData.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

import Foundation
import SwiftUI
import SchedHSE

class MockData {
    
    static let calendar: Calendar = .current
    
    static let lecturer = Lecturer(
        lecturer: "Лопаткин Виктор Евгеньевичawasdawda",
        lecturerEmail: "vlopatkin@hse.ru",
        lecturerOid: 12591,
        lecturer_rank: "Доцент",
        lecturer_title: "Лопаткин Виктор Евгеньевич"
    )
    
    static let classItem = ClassItem(
        tableofLessonsName: "1",
        contentOfLoadFaculty: "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771",
        parentschedule: "1 курс ДРИП 25/26 ",
        building: "Покровский б-р, д.11",
        auditorium: "R406",
        dayOfWeek: 6,
        contentTableOfLessonsName: 4,
        beginLesson: calendar.date(
            from: DateComponents(calendar: calendar, year: 2026, month: 2, day: 20, hour: 14, minute: 40)
        )!,
        endLesson: calendar.date(
            from: DateComponents(calendar: calendar, year: 2026, month: 2, day: 20, hour: 16, minute: 00)
        )!,
        lessonNumberEnd: 4,
        lessonNumberStart: 4,
        group: "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771",
        discipline: "Линейная алгебра и геометрия (рус)",
        kindOfWork: "Лекция",
        listOfLecturers: [
            MockData.lecturer
        ],
        lessonOid: 1
    )
    
    static let classItem1 = ClassItem(
        tableofLessonsName: "1",
        contentOfLoadFaculty: "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771",
        parentschedule: "1 курс ДРИП 25/26 ",
        building: "Покровский б-р, д.11",
        auditorium: "R406",
        dayOfWeek: 6,
        contentTableOfLessonsName: 4,
        beginLesson: calendar.date(
            from: DateComponents(calendar: calendar, year: 2026, month: 2, day: 21, hour: 14, minute: 40)
        )!,
        endLesson: calendar.date(
            from: DateComponents(calendar: calendar, year: 2026, month: 2, day: 21, hour: 16, minute: 00)
        )!,
        lessonNumberEnd: 4,
        lessonNumberStart: 4,
        group: "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771",
        discipline: "classItem1",
        kindOfWork: "Лекция",
        listOfLecturers: [
            MockData.lecturer
        ],
        lessonOid: 2
    )
    
    static let classItem2 = ClassItem(
        tableofLessonsName: "1",
        contentOfLoadFaculty: "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771",
        parentschedule: "1 курс ДРИП 25/26 ",
        building: "Покровский б-р, д.11",
        auditorium: "R406",
        dayOfWeek: 6,
        contentTableOfLessonsName: 4,
        beginLesson: calendar.date(
            from: DateComponents(calendar: calendar, year: 2026, month: 2, day: 21, hour: 13, minute: 00)
        )!,
        endLesson: calendar.date(
            from: DateComponents(calendar: calendar, year: 2026, month: 2, day: 21, hour: 14, minute: 20)
        )!,
        lessonNumberEnd: 4,
        lessonNumberStart: 4,
        group: "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771",
        discipline: "classItem2",
        kindOfWork: "Лекция",
        listOfLecturers: [
            MockData.lecturer
        ],
        lessonOid: 3
    )
    
    
}
