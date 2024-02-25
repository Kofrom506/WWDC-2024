//
//  ImageItemView.swift
//  wayangAR
//
//  Created by Evan Susanto on 21/02/24.
//

import SwiftUI

struct ImageItem: View {
    
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: String?
    
    
    let isSemar : Bool 
    
    
    let imageListPetruk = ["petruk"]
    let imageListSemar = ["semar"]

    var body: some View {
        ScrollView(.horizontal) {
                   HStack(spacing: 10) {
                       ForEach(isSemar ? imageListSemar : imageListPetruk, id: \.self) { imageName in
                           Button(action: {
                               self.isPlacementEnabled = true
                               self.selectedModel = imageName
                           }, label: {
                               Image(imageName)
                                   .resizable()
                                   .scaledToFill()
                                   .frame(width: 100, height: 100)
                                   .clipShape(RoundedRectangle(cornerRadius: 10))
                               .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                           })
            
                       }
                   }
                   .padding()
               }
           }
}

