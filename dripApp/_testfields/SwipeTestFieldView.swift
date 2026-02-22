//
//  SwipeTestFieldView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 21.02.2026.
//

import SwiftUI

fileprivate struct SwipeTestFieldView: View {
    
    @State var isExpanded: Bool = false
    @State var cardNumber: Int = 3
    @State var cardIndex: Int? = 0
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(0..<cardNumber, id: \.self) { i in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("hello")
                                Spacer()
                                if isExpanded {
                                    Rectangle()
                                        .frame(height: 50)
                                    Spacer()
                                }
                                Text("Hello")
                            }
                            Spacer()
                            VStack {
                                Text("hello")
                                Spacer()
                                Text("Hello")
                            }
                        }
                        .id(i)
                        .cardView(style: .cardView)
                        .padding(.horizontal)
                        .containerRelativeFrame(.horizontal, count: 1, span: 1, spacing: 0)
                    }
                    
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.paging)
            .scrollPosition(id: $cardIndex)
            .onTapGesture {
                withAnimation {
                    isExpanded.toggle()
                }
            }
            
            VStack {
                Spacer()
                HStack {
                    ForEach(0..<cardNumber, id: \.self) { i in
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(
                                (i == (cardIndex ?? -1)) ? .primary : .secondary
                            )
                    }
                }
                .padding(.bottom, 10)
            }
        }
    }
}



#Preview {
    ScrollView {
        LazyVStack {
            SwipeTestFieldView()
        }
    }
    .preferredColorScheme(.dark)
}
