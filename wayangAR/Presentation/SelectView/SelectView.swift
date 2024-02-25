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
                    
                    Spacer()
                    HStack {
                        Spacer()
                        NavigatePage(image: "start", destination: .selectView, geo: geo, multiplier: 0.4)
                        Spacer()
                        NavigatePage(image: "start", destination: .selectView, geo: geo, multiplier: 0.4)
                        Spacer()
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
    SelectView()
        .previewInterfaceOrientation(.landscapeLeft)
}
