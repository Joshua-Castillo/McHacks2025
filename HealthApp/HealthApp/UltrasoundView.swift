//
//  UltrasoundView.swift
//  HealthApp
//
//  Created by Joshua Castillo on 2025-01-25.
//

import SwiftUI
import RealityKit

struct UltrasoundView: View {
    @StateObject var tracking = TrackingProviders()
//    
    var body: some View {
        RealityView { content in
        }.task {
            await tracking.runTracking()
        }
        
    }
}
