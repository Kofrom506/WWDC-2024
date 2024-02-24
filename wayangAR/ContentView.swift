//
//  ContentView.swift
//  wayangAR
//
//  Created by Evan Susanto on 08/02/24.
//

import SwiftUI
import RealityKit
import ARKit

//struct BottomButtonView : View {
//    
//    @Binding var isPlacementEnabled: Bool
//    @Binding var selectedModel: String?
//    @Binding var modelConfirmedForPlacement: String?
//    var models: [String] = []
//    var body: some View {

////        ARViewContainer().edgesIgnoringSafeArea(.all)
////        ZStack {
////             
////                   Color.black.opacity(0.7)
////                       .edgesIgnoringSafeArea(.all)
////                   
////                   ScrollView(.horizontal) { // Use horizontal axis
////                       HStack(spacing: 20) {
////                           DetailItemView()
////                       }
////                       .padding(.top, 20)
////                   }
////                   .foregroundColor(.white) // Set text color to white
////               }
//        HStack(content: {
//            Button(action: {
//                self.isPlacementEnabled = false
//                self.selectedModel = nil
//            }, label: {
//                Image(systemName: "xmark")
//                    .frame(width: 60, height: 60)
//                    .font(.title)
//                    .background(Color.white.opacity(0.75))
//                    .cornerRadius(30)
//                    .padding(20)
//            })
//            Button(action: {
//                self.modelConfirmedForPlacement = self.selectedModel
//                print(modelConfirmedForPlacement)
//                self.isPlacementEnabled = false
//                self.selectedModel = nil
//            }, label: {
//                Image(systemName: "checkmark")
//                    .frame(width: 60, height: 60)
//                    .font(.title)
//                    .background(Color.white.opacity(0.75))
//                    .cornerRadius(30)
//                    .padding(20)
//            })
//        })
//    }
//}

//struct ImageItem: View {
//    @Binding var isPlacementEnabled: Bool
//    @Binding var selectedModel: String?
//    let imageList = ["fender", "toy"]
//
//    var body: some View {
//        ScrollView(.horizontal) {
//                   HStack(spacing: 10) {
//                       ForEach(imageList, id: \.self) { imageName in
//                           Button(action: {
//                               
//                               self.isPlacementEnabled = true
//                               self.selectedModel = imageName
//                           }, label: {
//                               Image(imageName)
//                                   .resizable()
//                                   .scaledToFill()
//                                   .frame(width: 100, height: 100)
//                                   .clipShape(RoundedRectangle(cornerRadius: 10))
//                               .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
//                           })
//                               
//                               
//                           
//                       }
//                   }
//                   .padding()
//               }
//           }
//}

struct ContentView : View {
    @State private var isPlacement = false
    @State private var selectedModel: String?
    @State private var modelConfirmedForPlacement: String?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            
            ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement).background(Color(.red))
            if !isPlacement{
                VStack {
                    ImageItem(isPlacementEnabled: $isPlacement, selectedModel: $selectedModel)
                    
                    
                }
            }else{
                VStack{
                    BottomButtonView(isPlacementEnabled: $isPlacement, selectedModel: $selectedModel, modelConfirmedForPlacement: $modelConfirmedForPlacement)
                }
               
            }
            Button("Sign In", action: {print(modelConfirmedForPlacement)})
            
            })
//        ARViewContainer().edgesIgnoringSafeArea(.all)
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelConfirmedForPlacement: String?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        let config = ARWorldTrackingConfiguration()
        let gridMaterial = SCNMaterial()
        
        gridMaterial.diffuse.contents = UIImage(named: "wayang.png")
        
        config.planeDetection = [.vertical]
        config.environmentTexturing = .automatic
        
        
        
        
//        var gridMaterial = SimpleMaterial()
//                   gridMaterial.baseColor = try! .texture(.load(named: "wayang.png"))
//
//                   // Apply the grid material to the modelEntity
//       modelEntity.model?.materials = [gridMaterial]
//        config.environmentTexturing = .manual
        arView.debugOptions = [
            .showAnchorOrigins,
            .showAnchorGeometry,
            .showFeaturePoints
        ]
        
        if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
            config.sceneReconstruction = .mesh
        }
        
//        let config = ARWorldTrackingConfiguration()
//        config.planeDetection = [.horizontal]
//        arView.session.run(config)
        
        
        arView.session.run(config)
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
//        print(self.modelConfirmedForPlacement, "BBBB")
        if let modelConfirmedForPlacement = self.modelConfirmedForPlacement {
            print("DEBUG: Adding Model to scene- \(modelConfirmedForPlacement)")
            let filename = modelConfirmedForPlacement + ".usdz"
            do {
                
                let modelEntity: ModelEntity = try ModelEntity.loadModel(named: filename)
               
                let anchorEntity = AnchorEntity(.plane(.vertical, classification: .any, minimumBounds: SIMD2(repeating: 2)))
               
                anchorEntity.addChild(modelEntity)
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
