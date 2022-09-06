//
//  MC_assignmet_1App.swift
//  MC_assignmet_1
//
//  Created by k2rth1k on 9/3/22.
//

import SwiftUI

@main
struct MC_assignmet_1App: App {
    
    @StateObject var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            RootView(appState: appState)
        }
    }
}
