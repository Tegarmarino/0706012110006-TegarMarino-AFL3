//
//  _706012110006_TegarMarino_AFL3App.swift
//  0706012110006-TegarMarino-AFL3
//
//  Created by Tegar Marino on 11/04/23.
//

import SwiftUI

@main
struct _706012110006_TegarMarino_AFL3App: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        
        #if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
        #endif


        #if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
        
        #if os(macOS)
        Settings {
            LandmarkSettings()
        }
        #endif
    }
}
