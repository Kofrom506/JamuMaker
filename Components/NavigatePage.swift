//
//  SwiftUIView.swift
//  
//
//  Created by Evan Susanto on 15/04/23.
//

import SwiftUI

struct NavigatePage: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    let image: String
    let destination: ScreenRoute
    var geo: GeometryProxy
    var multiplier: CGFloat = 0.15
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width * multiplier)
//            .background(
//                Color.red
//            )
            .onTapGesture {
                screenRouter.navigateTo(destination)
            }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
