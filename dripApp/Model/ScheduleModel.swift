//
//  ShceduleModel.swift
//  dripApp
//
//  Created by Тимофей Фролов on 22.02.2026.
//

import Foundation
import SwiftUI
import Combine
import SchedHSE


class ScheduleModel: ObservableObject {
    
    @Published public var schedule: [DayModelView] = []
    private var classItemSet: Set<ClassItem> {
        var res: Set<ClassItem> = .init()
        for dayModel in self.schedule {
            res.formUnion(dayModel.classItemList)
        }
        return res
    }
    
    private var groupList: [String] = []
    public var getGroupList: [String] { return self.groupList }
    
    public init(groupList: [String]) {
        self.groupList = groupList
    }
    
    public func update(groupList: [String]? = nil) async -> Bool {
        var resSuccess: Bool = true
        let dw = DateWork(beginningDate: .now, intervalIncrement: 14)
        var classItemSet: Set<ClassItem> = self.classItemSet
        for group in (groupList ?? self.groupList) {
            let urlString: String = UrlBuilder(groupoid: group,
                                         beginDate: dw.beginningDateString,
                                         endDate: dw.endDateString).url
            guard let loader: ItemLoader = try? ItemLoader(urlString: urlString) else { resSuccess = false; continue }
            guard let items: [ClassItem] = try? await loader.fetch() else { resSuccess = false; continue }
            classItemSet.formUnion(items)
        }
        guard resSuccess else { return false }
        let classItemList: [ClassItem] = .init(classItemSet).filter(TimaShed.filter).sorted { $0.beginLesson < $1.beginLesson }
        return self.integrate(classList: classItemList)
    }
    
    private func integrate(classList: [ClassItem], skippingOnFail: Bool = true) -> Bool {
        var newSchedule: [DayModelView] = .init()
        for i in classList {
            guard newSchedule.count > 0 else {
                guard let dmv = try? DayModelView(classList: [i]) else {
                    if skippingOnFail { continue } else { return false }
                }
                newSchedule.append(dmv)
                continue
            }
            let lastIndex = newSchedule.count - 1
            if Calendar.current.dateInterval(of: .day, for: newSchedule[lastIndex].date)!.contains(i.beginLesson) {
                guard newSchedule[lastIndex].insert(item: i) else {
                    if skippingOnFail { continue } else { return false }
                }
            } else {
                guard let dmv = try? DayModelView(classList: [i]) else {
                    if skippingOnFail { continue } else { return false }
                }
                newSchedule.append(dmv)
            }
        }
        self.schedule = newSchedule
        return true
    }
}
