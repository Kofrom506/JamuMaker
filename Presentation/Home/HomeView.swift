//
//  HomeView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
        @EnvironmentObject var user: User

    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                VStack(alignment: .center){
                    Spacer()
                    NavigatePage(image: "button_start", destination: .onBoarding, geo: geo, multiplier: 0.4)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
