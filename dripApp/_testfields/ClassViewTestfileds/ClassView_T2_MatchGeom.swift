//
//  MatchedGeometryEffectTestfield.swift
//  dripApp
//
//  Created by Тимофей Фролов on 21.02.2026.
//

import SwiftUI
import SchedHSE


struct ClassView_T2: View {
    
    let classItem: ClassItem
    @Binding var isExpanded: Bool
    
    @Namespace private var expansionAnimation
    
    @Namespace private var matchingClassTitle
    @Namespace private var matchingClassType
    @Namespace private var matchingRoomNumber
    @Namespace private var matchingBeginTime
    @Namespace private var matchingEndTime
    
    
    // MARK: body
    var body: some View {
        VStack {
            if isExpanded {
                bodyExpanded
            } else {
                bodyCollapsed
            }
        }
        .cardView(style: .cardView)
        .padding(.horizontal)
    }
    
    
    // MARK: collapsed body
    var bodyCollapsed: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(classItem.discipline)
                    .fontify(.classTitle)
                    .matchedGeometryEffect(
                        id: matchingClassTitle,
                        in: expansionAnimation
                    )
                Text(classItem.kindOfWork)
                    .fontify(.classType)
                    .matchedGeometryEffect(
                        id: matchingClassType,
                        in: expansionAnimation
                    )
                Spacer()
                Text(classItem.auditorium)
                    .fontify(
                        .roomNumber,
                        color: Color.secondarySystemBackground
                    )
                    .cardView(
                        style: .roomNumber,
                        background: .primary
                    )
                    .matchedGeometryEffect(
                        id: matchingRoomNumber,
                        in: expansionAnimation
                    )
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(classItem.beginLesson.timeHHmm)
                    .matchedGeometryEffect(
                        id: matchingBeginTime,
                        in: expansionAnimation
                    )
                Spacer()
                Text(classItem.endLesson.timeHHmm)
                    .matchedGeometryEffect(
                        id: matchingEndTime,
                        in: expansionAnimation
                    )
            }
            .padding(.trailing, 5)
            .padding(.vertical, 5)
            .fontify(.classTime)
            .frame(width: 55)
        }
    }
    
    
    // MARK: expanded body
    var bodyExpanded: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(classItem.discipline)
                        .fontify(.classTitle)
                        .matchedGeometryEffect(
                            id: matchingClassTitle,
                            in: expansionAnimation
                        )
                    Text(classItem.kindOfWork)
                        .fontify(.classType)
                        .matchedGeometryEffect(
                            id: matchingClassType,
                            in: expansionAnimation
                        )
                }
                Spacer()
                Text(String(classItem.lessonNumberStart))
                    .fontify(.classTitle)
                    .frame(width: 30, height: 30, alignment: .center)
                    .frame(width: 55, height: 55, alignment: .topTrailing)
            }
            
            if isExpanded {
                ForEach(classItem.listOfLecturers) { lecturer in
                    LecturerView(lecturer: lecturer)
                        .transition(.scale)
                }
            }
            
            
            HStack(alignment: .bottom) {
                Text(classItem.auditorium)
                    .fontify(
                        .roomNumber,
                        color: Color.secondarySystemBackground
                    )
                    .cardView(
                        style: .roomNumber,
                        background: .primary
                    )
                    .matchedGeometryEffect(
                        id: matchingRoomNumber,
                        in: expansionAnimation
                    )
                Spacer()
                VStack(alignment: .trailing, spacing: 9.5) {
                    Text(classItem.beginLesson.timeHHmm)
                        .matchedGeometryEffect(
                            id: matchingBeginTime,
                            in: expansionAnimation
                        )
                    Text(classItem.endLesson.timeHHmm)
                        .matchedGeometryEffect(
                            id: matchingEndTime,
                            in: expansionAnimation
                        )
                }
                .padding(.trailing, 5)
                .padding(.vertical, 5)
                .fontify(.classTime)
                .frame(width: 55)
            }
        }
    }
}

//fileprivate struct MatchedGeometryPreview: View {
//    
//    @State var isExpanded: Bool = true
//    
//    var body: some View {
//        ScrollView {
//            ClassView(
//                classItem: MockData.classItem,
//                isExpanded: $isExpanded
//            )
//            .onTapGesture {
//                withAnimation(.springify) {
//                    isExpanded.toggle()
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    MatchedGeometryPreview()
//}
