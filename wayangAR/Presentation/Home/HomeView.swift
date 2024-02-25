//
//  HomeView.swift
//  wayangAR
//
//  Created by Evan Susanto on 21/02/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("bg_start")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                VStack(alignment: .center){
                    Spacer()
                    
                    NavigatePage(image: "start", destination: .selectView, geo: geo, multiplier: 0.4)
                    Button("StringProtocol") {
                        print("Debug Value: \(screenRouter.navigateTo(.home))")
                        screenRouter.navigateTo(.selectView)
                    }
                    Spacer()
                        .frame(height: geo.size.height * 0.1)
                }
                VStack{
                    Spacer()
                }.padding(.vertical, ViewPadding.xlarge)
            }.ignoresSafeArea()
        }
    }
}


#Preview {
    HomeView()
        .previewInterfaceOrientation(.landscapeLeft)

}
