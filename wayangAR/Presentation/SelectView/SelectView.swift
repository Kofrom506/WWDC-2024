//
//  SelectView.swift
//  wayangAR
//
//  Created by Evan Susanto on 26/02/24.
//

import SwiftUI

struct SelectView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
 
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("bg_select")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                VStack(alignment: .center){

                    HStack {
                        Spacer()
                        
                        NavigatePage(image: "select", destination: .onBoardingPetruk, geo: geo, multiplier: 0.3)
                        Spacer()
                        NavigatePage(image: "select", destination: .onBoardingSemar, geo: geo, multiplier: 0.3)
                        Spacer()
                    }  .padding(.top, geo.size.height * 0.8)
                   
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



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
