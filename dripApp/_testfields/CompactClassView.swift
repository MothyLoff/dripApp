//
//  CompactClassView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 01.03.2026.
//

import SwiftUI
import SchedHSE

struct CompactClassView: View {
    
    let classItem: ClassItem
    
    var symbol: String { .init(classItem.discipline.first!) }
    var name: String {
        let index0 = classItem.discipline.startIndex
        let index1 = classItem.discipline.index(after: index0)
        return .init(classItem.discipline[index1...])
    }
    
    let mainFont: CGFloat = 22
    
    var body: some View {
        HStack(alignment: .center) {
            HStack(spacing: 2) {
                Text(symbol)
                    .fontify(size: mainFont)
                    .offset(
                        x: -mainFont / 100,
                        y: -mainFont / 190
                    )
                    .frame(
                        width: mainFont * 1.1,
                        height: mainFont * 1.1,
                        alignment: .center
                    )
                Text(name) // TODO: mapping
                    .fontify(size: mainFont)
            }
            
            Spacer()
            
            VStack(alignment: .leading)  {
                Text(classItem.kindOfWork)
                HStack(spacing: 0) {
                    Text(classItem.beginLesson.timeHHmm)
                    Text("-")
                    Text(classItem.endLesson.timeHHmm)
                }
            }
            .fontify(size: mainFont - 11)
            .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(RoomNumber(classItem.auditorium).stringNumber)
                .fontify(size: mainFont)
                .foregroundStyle(.background)
                .padding(.horizontal, 12)
                .frame(height: 40)
                .background(
                    Capsule()
                )
        }
        .padding(.leading, 19)
        .padding(.vertical, 10)
        .padding(.trailing, 10)
        .background(
            Capsule()
                .fill(.background.secondary)
        )
        .frame(height: 60)
        .padding(.horizontal, 34)
    }
}

#Preview {
    ScrollView {
        VStack {
            CompactClassView(classItem: MockData.classItemOBA)
            CompactClassView(classItem: MockData.classItemCalculus)
        }
    }
}
