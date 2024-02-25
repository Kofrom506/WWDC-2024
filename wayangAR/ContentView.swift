//
//  ContentView.swift
//  wayangAR
//
//  Created by Evan Susanto on 08/02/24.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    let screenRouter = ScreenRouter(rootScreen: .selectView, factory: ScreenRouterFactory())
    var body: some View {
        ZStack{
            SelectView()
//                .environment(.scree)
            
//            HomeView()
                .environmentObject(screenRouter)
               
        }
      
    }
}



#Preview {
    ContentView()
}


// HomeScreen
// Instrction
// baru masuk ke main


//import SwiftUI
//import RealityKit
//import ARKit
//
//struct ContentView: View {
//    var body: some View {
//        ARViewContainer()
//            .ignoresSafeArea()
//    }
//}
//
//struct ARViewContainer: UIViewRepresentable {
//    func makeUIView(context: Context) -> ARView {
//        let arView = ARView(frame: .zero)
//        
//        let config = ARWorldTrackingConfiguration()
//        config.planeDetection = .horizontal
//        arView.session.run(config)
//        
//        return arView
//    }
//    
//    func updateUIView(_ uiView: ARView, context: Context) {
//        guard let frame = uiView.session.currentFrame else { return }
//        
//        for anchor in frame.anchors {
//            if let planeAnchor = anchor as? ARPlaneAnchor {
//                let plane = MeshResource.generatePlane(width: planeAnchor.extent.x, depth: planeAnchor.extent.z)
//                let material = SimpleMaterial(color: .clear, roughness: 0.5, isMetallic: false)
//                let entity = ModelEntity(mesh: plane, materials: [material])
//                
//                let anchorEntity = AnchorEntity(plane: .horizontal)
//                anchorEntity.addChild(entity)
//                
//                uiView.scene.addAnchor(anchorEntity)
//                
//                let gridMaterial = SimpleMaterial(texture: .load(named: "grid.png"))
//                let gridEntity = ModelEntity(mesh: plane, materials: [gridMaterial])
//                
//                let gridAnchorEntity = AnchorEntity(plane: .horizontal)
//                gridAnchorEntity.addChild(gridEntity)
//                
//                uiView.scene.addAnchor(gridAnchorEntity)
//            }
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
