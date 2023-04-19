//
//  HomeView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct MapView: View {
    @EnvironmentObject var screenRouter: ScreenRouter
 
        @EnvironmentObject var user: User
//    var user: User = User(
//        name: "Evan Susanto",
//        inventoryIngridient: ["Tamarind": 0, "Rice": 0, "Chili": 0, "Salt": 0, "Palm Sugar": 0, "Ginger": 0, "Cinnamon": 0, "Galangal": 0, "Turmeric": 0, "Honey": 0, "Andrographis": 0, "Lemongrass": 0, "Betel Leaf": 0, "Curcuma": 0],
//        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
//    )
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Image("background_map")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
               
                ZStack{
                    Spacer()
                    NavigatePage(image: "pin_jawa", destination: .gather, geo: geo, multiplier: 0.1, action: {
                        user.userLocation = .jawa
                    })
                        .offset(x: -geo.size.width * 0.109, y: geo.size.height * 0.136)
                        .shadow(color: JColor.yellow.opacity(0.8), radius: 10)
                    Spacer()
                    NavigatePage(image: "pin_kalimantan", destination: .gather, geo: geo, multiplier: 0.1, action: {
                        user.userLocation = .kalimantan
                    })
                        .offset(x: -geo.size.width * 0.05, y: -geo.size.height * 0.09)
                        .shadow(color: JColor.yellow.opacity(0.9), radius: 20)
                        
                    Spacer()
                    NavigatePage(image: "pin_sumatra", destination: .gather, geo: geo, multiplier: 0.1, action: {
                        user.userLocation = .sumatra
                    })
                        .offset(x: -geo.size.width * 0.366, y: -geo.size.height * 0.175)
                        .shadow(color: JColor.yellow.opacity(0.9), radius: 20)
                        
                    Spacer()
                    NavigatePage(image: "pin_sulawesi", destination: .gather, geo: geo, multiplier: 0.1, action: {
                        user.userLocation = .sulawesi
                    })
                        .offset(x: geo.size.width * 0.146, y: -geo.size.height * 0.09)
                        .shadow(color: JColor.yellow.opacity(0.9), radius: 20)
                    Spacer()
                    NavigatePage(image: "pin_papua", destination: .gather, geo: geo, multiplier: 0.1, action: {
                        user.userLocation = .papua
                    })
                        .offset(x: geo.size.width * 0.402,  y: 0)
                        .shadow(color: JColor.yellow.opacity(0.9), radius: 20)

                }
                VStack{
                    Spacer()
                    HStack{
                        
                        NavigatePage(image: "button_menu", destination: .home, geo: geo)
                        Spacer()
                        NavigatePage(image: "button_brew", destination: .jamu, geo: geo)
                    }.padding(.horizontal, ViewPadding.xlarge)
                }.padding(.bottom, ViewPadding.xlarge)
            }.padding(.vertical, ViewPadding.xlarge)
        }.ignoresSafeArea()
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}





