//
//  WayangViewSemar.swift
//  wayangAR
//
//  Created by Evan Susanto on 26/02/24.
//

import SwiftUI

struct WayangViewSemar: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    @State private var isPlacement = false
    @State private var selectedModel: String?
    @State private var modelConfirmedForPlacement: String?
    
    var body: some View {
        ZStack(alignment: .bottomTrailing, content: {
            ARViewContainer( modelConfirmedForPlacement: $modelConfirmedForPlacement).ignoresSafeArea()
            
//            ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement).ignoresSafeArea()
            if !isPlacement{
                VStack {
                    ImageItem(isPlacementEnabled: $isPlacement, selectedModel: $selectedModel, isSemar: true)
                }
            }else{
                
                HStack(alignment: .center){
                    Spacer()
                    BottomButtonView(isPlacementEnabled: $isPlacement, selectedModel: $selectedModel, modelConfirmedForPlacement: $modelConfirmedForPlacement)
                    Spacer()
                }
               
            }
            
            Button("Back") {
                screenRouter.navigateTo(.selectView)
            }
         
//
//
            })

        
    }
}

#Preview {
    WayangViewSemar()
}
