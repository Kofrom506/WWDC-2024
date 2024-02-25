//
//  ARView.swift
//  wayangAR
//
//  Created by Evan Susanto on 21/02/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    @EnvironmentObject var screenRouter: ScreenRouter
    @Binding var modelConfirmedForPlacement: String?

    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
  config.planeDetection = [.vertical]
       config.environmentTexturing = .automatic
        
        
        
    arView.debugOptions = [
            .showAnchorOrigins,
            .showAnchorGeometry,
        ]
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        

        
        
        arView.session.run(config)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        if let modelConfirmedForPlacement = self.modelConfirmedForPlacement {
            let filename = modelConfirmedForPlacement + ".usdz"
            do {
                let modelEntity: ModelEntity = try ModelEntity.loadModel(named: filename)
                
                uiView.scene.anchors.removeAll()

                var alignment: ARPlaneAnchor.Alignment = .vertical

                if let frame = uiView.session.currentFrame {
                    let verticalPlanes = frame.anchors.compactMap { $0 as? ARPlaneAnchor }
                    if !verticalPlanes.isEmpty {
                        alignment = .vertical
                    }
                }

                let anchorEntity = AnchorEntity()


                anchorEntity.addChild(modelEntity)
                anchorEntity.addChild(modelEntity.clone(recursive: true))
                uiView.scene.addAnchor(anchorEntity)

                DispatchQueue.main.async {
                    self.modelConfirmedForPlacement = nil
                }
            } catch {
                print("Error loading model: \(error)")
            }

        }
    }
    
}

