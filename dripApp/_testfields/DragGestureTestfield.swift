//
//  DragGestureTestfield.swift
//  dripApp
//
//  Created by Тимофей Фролов on 21.02.2026.
//

import SwiftUI

struct DragGestureView: View {
    
    @State var offset: CGSize = .zero
    @State var isDragging: Bool = false
    
    var body: some View {
        let dg = DragGesture()
            .onChanged { value in
                offset = value.translation
                withAnimation {
                    isDragging = true
                }
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        VStack {
            Circle()
                .frame(width: 50, height: 50)
                .foregroundColor(
                    .red.exposureAdjust(isDragging ? 0 : -1)
                )
                .scaleEffect(isDragging ? 1.4 : 1)
                .offset(offset)
                .gesture(dg)
            Text(String(Int(offset.width)))
        }
    }
}

#Preview {
    DragGestureView()
}
