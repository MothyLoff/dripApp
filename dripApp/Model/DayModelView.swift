//
//  DayModel.swift
//  dripApp
//
//  Created by Тимофей Фролов on 22.02.2026.
//

import Foundation
import SchedHSE
import SwiftUI


struct DayModelView: View, Identifiable {
    var id: Date { return self.date }
    
    var dateString: String { return self.date.toDayMonthWeekdayString() }
    
    private var schedule: [[ClassItem]] = .init(repeating: [], count: 8)
    public var classItemList: [ClassItem] {
        var res: [ClassItem] = .init()
        res.reserveCapacity(6)
        for slot in self.schedule {
            for i in slot {
                res.append(i)
            }
        }
        return res
    }
    private var filteredSchedule: [[ClassItem]] { self.schedule.filter { !$0.isEmpty } }
    let date: Date
    
    init(classList: [ClassItem]) throws {
        // TODO: make a propper error
        guard !classList.isEmpty else { throw CocoaError(.keyValueValidation) }
        
        Self.distributeClassItems(classList: classList, target: &self.schedule)
        self.date = Calendar.current.dateInterval(of: .day, for: classList.first!.beginLesson)!.start
    }
    
    
    // MARK: body --------
    var body: some View {
        Section {
            VStack {
                ForEach(self.filteredSchedule.indices, id: \.self) { index in
                    let classPool: [ClassItem] = self.filteredSchedule[index]
                    ScheduleItemView(classList: classPool)
                }
            }
        } header: {
            Text(dateString)
                .fontify(.dayTitle)
                //.blendMode(.difference)
        }
    }
    
    internal mutating func insert(item: ClassItem) -> Bool {
        guard Calendar.current
            .dateInterval(of: .day, for: self.date)!
            .contains(item.beginLesson)
        else { return false }
        
        do {
            let insertIndex: Int = try Self.getClassItemNumber(classItem: item) - 1
            self.schedule[insertIndex].append(item)
            self.schedule[insertIndex].sort { $0.beginLesson <= $1.beginLesson }
            return true
        } catch {
            return false
        }
    }
    
    static func distributeClassItems(classList: [ClassItem], target: inout [[ClassItem]]) {
        for item in classList {
            guard let number = try? Self.getClassItemNumber(classItem: item) else { continue }
            target[number - 1].append(item)
        }
    }
    
    static func getClassItemNumber(classItem: ClassItem) throws -> Int {
        let begin = classItem.beginLesson.hm
        let end = classItem.endLesson.hm
        let stamp: (Int, Int, Int, Int) = (begin.h, begin.m, end.h, end.m)
        
        let result = switch stamp {
        case (10, 00, 11, 20), (9, 30, 10, 50): 1 // ok
        case (11, 30, 12, 50), (11, 10, 12, 30): 2 // ok
        case (13, 00, 14, 20), (13, 00, 14, 20): 3 // ok
        case (14, 30, 15, 50), (14, 40, 16, 00): 4 // ok
        case (16, 00, 17, 20), (16, 20, 17, 40): 5 // ok
        case (17, 30, 18, 50), (18, 10, 19, 30): 6 // ok
        case (19, 00, 20, 20), (19, 40, 21, 00): 7 // ok
        case (20, 35, 21, 55): 8 // ok
        default:
            // TODO: make a propper error
            throw CocoaError(.keyValueValidation)
        }
        
        return result
    }
}


#Preview {
    ContentView()
}
