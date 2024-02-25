//
//  NavigatePage.swift
//  wayangAR
//
//  Created by Evan Susanto on 21/02/24.
//

import SwiftUI


struct NavigatePage: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    let image: String
    let destination: ScreenRoute
    let geo: GeometryProxy
    var multiplier: CGFloat = 0.15
    let action: (() -> Void)?
    
    
    init(image: String, destination: ScreenRoute, geo: GeometryProxy, multiplier: CGFloat = 0.15, action:  (() -> Void)? = nil) {
        self.image = image
        self.destination = destination
        self.geo = geo
        self.multiplier = multiplier
        self.action = action
    }
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width * multiplier)
     
            .onTapGesture {
                print(destination)
                print("Clicked")
                screenRouter.navigateTo(destination)
                self.action?()
                
            }
    }
}

//#Preview {
//    NavigatePage(image: "", destination: .onBoarding, geo: geo)
//}
