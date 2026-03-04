//
//  SelectionView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 04.03.2026.
//

import SwiftUI

struct SelectionViewTestfield: View {
    
    
    
    var body: some View {
        LazyVStack(alignment: .leading, pinnedViews: [.sectionHeaders]) {
            Section {
                Text("Сообщение")
            } header: {
                Text("Сегодня")
                    .padding(.horizontal)
                    .background(.background)
            }
        }
    }
}

#Preview {
    SelectionViewTestfield()
}
