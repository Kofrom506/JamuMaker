//
//  SwiftUIView 2.swift
//  
//
//  Created by Evan Susanto on 17/04/23.
//

import SwiftUI

struct DetailLocationView: View {
    var location: Location
    var body: some View {
        VStack{
            Image(location.rawValue.lowercased())
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .background(
                    Circle()
                        .foregroundColor(JColor.yellowSoft)
                        .padding(.all, -ViewPadding.medium)
                ).padding(.trailing, ViewPadding.small)
            Text(location.rawValue)
                .font(JFont.semiBold(fontFamily: .poppins, size: 30))
        }
    }
}

struct DetailLocationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailLocationView(location: .jawa)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
