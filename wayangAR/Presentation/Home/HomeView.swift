//
//  HomeView.swift
//  wayangAR
//
//  Created by Evan Susanto on 21/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                VStack(alignment: .center){
//                    Spacer()
//                    NavigatePage(image: "button_start", destination: .onBoarding, geo: geo, multiplier: 0.4)
//                    Spacer()
//                        .frame(height: geo.size.height * 0.1)
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
