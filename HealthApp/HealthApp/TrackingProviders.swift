//
//  TrackingProviders.swift
//  HealthApp
//
//  Created by Joshua Castillo on 2025-01-25.
//

import RealityKit
import SwiftUI
import ARKit
import RealityKitContent

@MainActor class TrackingProviders: ObservableObject {
    
    private let session = ARKitSession()
    let rootEntity = Entity()
    let imageInfo = ImageTrackingProvider(referenceImages: ReferenceImage.loadReferenceImages(inGroupNamed: "AR Resources"))
    private var imageAnchors: [UUID: ImageAnchor] = [:]
    private var entityMap: [UUID: ModelEntity] = [:]
    
    func runTracking() async {
        if ImageTrackingProvider.isSupported {
            Task {
                try await session.run([imageInfo])
                for await update in imageInfo.anchorUpdates {
                    updateImage(update.anchor)
                }
            }
        }
    }
    
    func updateImage(_ anchor: ImageAnchor) {
        if imageAnchors[anchor.id] == nil {
            // Add a new entity to represent this image.
            let entity = ModelEntity(mesh: .generateSphere(radius: 0.05))
            entityMap[anchor.id] = entity
            rootEntity.addChild(entity)
        }
        
        if anchor.isTracked {
            entityMap[anchor.id]?.transform = Transform(matrix: anchor.originFromAnchorTransform)
            print(anchor.originFromAnchorTransform)
        }
    }
   
}

