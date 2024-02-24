//
//  DetailItemView.swift
//  wayangAR
//
//  Created by Evan Susanto on 15/02/24.
//

import SwiftUI

struct DetailItemView: View {
    var body: some View {
        VStack{
            Image("location.rawValue.lowercased()")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .background(
                    Circle()
                        .foregroundColor(JColor.yellowSoft)
                        .padding(.all, -ViewPadding.medium)
                ).padding(.trailing, ViewPadding.small)
            Text("location.rawValue")
                .font(JFont.semiBold(fontFamily: .poppins, size: 15))
        }
    }
}

#Preview {
    DetailItemView()
}
