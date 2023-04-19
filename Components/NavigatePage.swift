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
        //            .background(
        //                Color.red
        //            )
            .onTapGesture {
                
                screenRouter.navigateTo(destination)
                self.action?()
                
            }
    }
}

//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}
