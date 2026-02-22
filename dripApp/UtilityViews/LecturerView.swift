//
//  LecturerView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 20.02.2026.
//

import SwiftUI
import SchedHSE

struct LecturerView: View {
    
    var lecturer: Lecturer
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.fill")
                .fontify(.dayTitle)
                .cardView(style: .roomNumber, background: .clear)
            VStack(alignment: .leading) {
                Text(lecturer.lecturerLastName.prefix(17))
                    .fontify(.lecturerName, color: .primary)
                    .fixedSize(horizontal: true, vertical: true)
                Text(lecturer.lecturerName.prefix(17))
                    .fontify(.lecturerName, color: .primary)
                    .fixedSize(horizontal: true, vertical: true)
                Text(lecturer.lecturerEmail.prefix(25))
                    .fontify(.classTime, color: .secondary)
                    .fixedSize(horizontal: true, vertical: true)
            }
        }
    }
}

#Preview {
    LecturerView(lecturer: MockData.lecturer)
}
