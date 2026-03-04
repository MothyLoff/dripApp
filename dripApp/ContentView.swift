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
    
    @State private var statusBarHeight: CGFloat = 0
    
    var body: some View {
        ZStack {
            ZStack(alignment: .top) {
                ScrollView {
                    LazyVStack(spacing: 20, pinnedViews: [.sectionHeaders]) {
                        ForEach(self.scheduleModel.schedule) { i in
                            i.body
                        }
                    }
                }
            }
            if isLoading {
                Text("loading")
                    .fontify(.classTitle)
            }
        }
        .background(
            GeometryReader { geo in
                Color.clear
                    .onAppear {
                        statusBarHeight = geo.safeAreaInsets.top / 20
                    }
            }
            .ignoresSafeArea()
        )
        .safeAreaInset(edge: .top, spacing: 0) {
            LinearGradient(
                colors: [
                    Color(.systemBackground),
                    Color(.systemBackground).opacity(0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            .frame(height: statusBarHeight)
        }
        .task {
            isLoading = true
            let _ = await self.scheduleModel.update()
            isLoading = false
        }
        .refreshable {
            isLoading = true
            let _ = await self.scheduleModel.update()
            isLoading = false
        }
    }
}

#Preview {
    ContentView()
}
