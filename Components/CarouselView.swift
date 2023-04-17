//
//  SwiftUIView.swift
//  
//
//  Created by Evan Susanto on 15/04/23.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack {
                    Spacer()
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing: 20){
                            ForEach(jamus) { jamu in
                                JamuCarouselComponent(jamu: jamu, geo: geo)
                                    .rotation3DEffect(Angle(degrees: Double(geo.frame(in: .global).minX) / -20), axis: (x: 0.0, y: 10.0, z: 0.0))
                            }
                        }.padding(.horizontal, ViewPadding.xmedium)
                    }.shadow(radius: 10)
                        .padding(.horizontal, -ViewPadding.xmedium)
                    Spacer()
                }
            }
           
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
