//
//  ContentView.swift
//  dripApp
//
//  Created by Тимофей Фролов on 19.02.2026.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var scheduleModel = ScheduleModel(groupList: TimaShed.groups)
    @State var isLoading: Bool = false
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVStack {
                    ForEach(self.scheduleModel.schedule) { i in
                        i.body
                    }
                }
            }
            if isLoading {
                Text("loading")
                    .fontify(.classTitle)
            }
        }
        .task {
            withAnimation {
                isLoading = true
            }
            let _ = await self.scheduleModel.update()
            withAnimation {
                isLoading = false
            }

        }
        .refreshable {
            withAnimation {
                isLoading = true
            }
            let _ = await self.scheduleModel.update()
            withAnimation {
                isLoading = false
            }
        }
    }
}

#Preview {
    ContentView()
}
