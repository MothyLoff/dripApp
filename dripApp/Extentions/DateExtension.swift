//
//  DateHHmmExtension.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

import Foundation

extension Date {
    internal var timeHHmm: String {
        Self.hhmmFormatter.string(from: self)
    }
    
    internal func toDayMonthWeekdayString() -> String {
            let f = DateFormatter()
            f.locale = .autoupdatingCurrent
            f.dateFormat = "dd.MM EEEE"
            return f.string(from: self)
        }
    
    internal var hm: (h: Int, m: Int) { hm() }

    private static let hhmmFormatter: DateFormatter = {
        let f = DateFormatter()
        f.locale = Locale(identifier: "en_US_POSIX")
        f.timeZone = .current
        f.dateFormat = "HH:mm"
        return f
    }()
    
    private func hm(in calendar: Calendar = .current) -> (h: Int, m: Int) {
           let c = calendar.dateComponents([.hour, .minute], from: self)
           return (h: c.hour ?? 0, m: c.minute ?? 0)
       }

    
}
