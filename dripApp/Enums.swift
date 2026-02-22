//
//  Enums.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

import SwiftUI


// MARK: view ---------
enum CardStyle: CGFloat {
    case cardView = 36
    case roomNumber = 20
}

enum FontifyStyle {
    case roomNumber
    case classTitle
    case classType
    case classTime
    case classTimeActive
    case dayTitle
    
    case lecturerName
}


// MARK: model ---------
enum EduGroupoid {
    static let drip251: String = "41282"
    static let drip252: String = "41283"
    static let dpm251: String = "40668"
    static let bse251: String = "41039"
}

enum Faculty {
    static let blank: String = ""
    static let drip: String = "Б 09.03.04 ФКН М 2024 очная Дизайн и разработка информационных продуктов 771"
    static let se: String = "Б 09.03.04 ФКН М 2014 очная Программная инженерия 288"
    static let united: String = "Объединенный план общевузовских дисциплин"
    static let creativeIndustry: String = "Б 38.03.02, 42.03.05 ФКИ М 2022 очная Управление в креативных индустриях 530"
    static let phil: String = "Б 45.03.01 СПБ ШГНИ СПБ 2018 очная Филология 423"
}

enum Discipline {
    static let dm: String = "Дискретная математика (рус)"
}
