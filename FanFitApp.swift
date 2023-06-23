//
//  FanFitApp.swift
//  FanFitapp
//
//  Created by Drew Mudry on 06/26/22.
//

import SwiftUI
import Firebase

@main
struct FanFitApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
