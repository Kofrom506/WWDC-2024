//
//  ButtomBottomView.swift
//  wayangAR
//
//  Created by Evan Susanto on 21/02/24.
//

import SwiftUI
struct BottomButtonView : View {
   
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: String?
    @Binding var modelConfirmedForPlacement: String?
    var models: [String] = []
    var body: some View {
        
        HStack(content: {
            Button(action: {
                self.isPlacementEnabled = false
                self.selectedModel = nil
            }, label: {
                Image(systemName: "xmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            })
            Button(action: {
                self.modelConfirmedForPlacement = self.selectedModel
                print(modelConfirmedForPlacement)
                self.isPlacementEnabled = false
                self.selectedModel = nil
            }, label: {
                Image(systemName: "checkmark")
                    .frame(width: 60, height: 60)
                    .font(.title)
                    .background(Color.white.opacity(0.75))
                    .cornerRadius(30)
                    .padding(20)
            })
        })
    }
}

//#Preview {
//    ButtomBottomView()
//}
