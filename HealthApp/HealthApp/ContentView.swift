//
//  ContentView.swift
//  HealthApp
//
//  Created by Joshua Castillo on 2025-01-25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    @State var showImmersiveSpace = false
    
    var body: some View {
        VStack() {
            Toggle(showImmersiveSpace ? "Stop Ultrasound" : "Start Ultrasound", isOn: $showImmersiveSpace).onChange(of:showImmersiveSpace) { _, isShowing in
                Task {
                    if isShowing {
                        await openImmersiveSpace(id: "ImmersiveSpace")
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            
            }
            .toggleStyle(.button)
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
