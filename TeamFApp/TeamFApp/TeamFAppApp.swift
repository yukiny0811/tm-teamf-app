//
//  TeamFAppApp.swift
//  TeamFApp
//
//  Created by Yuki Kuwashima on 2023/11/29.
//

import TeamFLibrary

@main
struct TeamFAppApp: App {
    
    init() {
        LocationManager.shared.requestAuthorization()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(DataManager.container)
        }
    }
}
