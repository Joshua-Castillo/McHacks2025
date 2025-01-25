//
//  HealthAppApp.swift
//  HealthApp
//
//  Created by Joshua Castillo on 2025-01-25.
//

import SwiftUI

@main
struct HealthApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            UltrasoundView()
        }

     }
}
