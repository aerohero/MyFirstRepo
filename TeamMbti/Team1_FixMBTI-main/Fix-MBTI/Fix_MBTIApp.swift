//
//  Fix_MBTIApp.swift
//  Fix-MBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import SwiftUI
import SwiftData

@main
struct Fix_MBTIApp: App {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true // 첫 실행인지 여부

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Mission.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                MBTISelectionView() // 첫 실행일때 mbti선택 뷰
            } else {
                ContentView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
