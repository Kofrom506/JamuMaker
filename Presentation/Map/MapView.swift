//
//  HomeView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct MapView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    //    @EnvironmentObject var user: User
    var user: User = User(
        name: "Evan Susanto",
        inventoryIngridient: ["Asam Jawa": 0, "Beras": 0, "Cabe": 0, "Garam": 0, "Gula Aren": 0, "Jahe": 0, "Kayu Manis": 0, "Kencur": 0, "Kunyit": 0, "Madu": 0, "Sambiloto": 0, "Serai": 0, "Sirih": 0, "Temulawak": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
    )
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("background_map")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                VStack(alignment: .center){
                    Spacer()
                    NavigatePage(image: "button_save", destination: .gather, geo: geo, multiplier: 0.15)
                        .offset(x: -250, y: -120)
                    
                    Spacer()
                        .frame(height: geo.size.height * 0.1)
                }
                
                VStack{
                    
                    //                    PrimaryButton(title: "Brew Jamu",backgroundColor: JColor.greenPastel,foregroundColor: .red) {
                    //                        screenRouter.navigateTo(.jamu)
                    //                    }
                    //                    PrimaryButton(title: "Gather  Ingridients",backgroundColor: JColor.greenPastel,foregroundColor: .red) {
                    //                        screenRouter.navigateTo(.gather)
                    //                    }
                    //                    PrimaryButton(title: "Almanac  ",backgroundColor: JColor.greenPastel,foregroundColor: .red) {
                    //                        screenRouter.navigateTo(.almanac)
                    //                    }
                    //                    PrimaryButton(title: "Hero  Jamu",backgroundColor: JColor.greenPastel,foregroundColor: .red) {
                    //                        screenRouter.navigateTo(.hero)
                    //                    }
                    Spacer()
                }.padding(.vertical, ViewPadding.xlarge)
            }.ignoresSafeArea()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
