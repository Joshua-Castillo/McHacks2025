//
//  ModelEntity+Extension.swift
//  HealthApp
//
//  Created by Joshua Castillo on 2025-01-25.
//

import RealityKit
extension ModelEntity {
    class func createFingerTip() -> ModelEntity {
        let entity = ModelEntity(
            mesh: .generateSphere(radius: 0.005),
            materials: [UnlitMaterial(color: .cyan)],
            collisionShape: .generateSphere(radius: 0.005),
            mass: 0.0
        )
        
        entity.components.set(PhysicsBodyComponent(mode: .kinematic))
        entity.components.set(OpacityComponent(opacity: 1.0))
        
        return entity
    }
}
