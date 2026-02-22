//
//  CustomFilters.swift
//  dripApp
//
//  Created by Тимофей Фролов on 22.02.2026.
//

import SchedHSE

internal class TimaShed {
    static let groups: [String] = [
        EduGroupoid.drip252,
        EduGroupoid.bse251
    ]
    
    static var filter: (ClassItem) -> Bool = { item in
        let c1 = item.contentOfLoadFaculty == Faculty.drip && item.discipline != "Дискретная математика"
        let c2 = item.contentOfLoadFaculty == Faculty.creativeIndustry && item.dayOfWeek == 2  // history
        let c3 = item.contentOfLoadFaculty == Faculty.se && item.discipline == "Дискретная математика"
        return c1 || c2 || c3
    }
}
