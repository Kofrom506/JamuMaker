//
//  ContentView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct ContentView: View {
    let screenRouter = ScreenRouter(rootScreen: .home, factory: ScreenRouterFactory())
    @StateObject var user: User = User(
        name: "Evan Susanto",
        inventoryIngridient: ["Tamarind": 0, "Rice": 0, "Chili": 0, "Salt": 0, "Palm Sugar": 0, "Ginger": 0, "Cinnamon": 0, "Galangal": 0, "Turmeric": 0, "Honey": 0, "Andrographis": 0, "Lemongrass": 0, "Betel Leaf": 0, "Curcuma": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih":0, "Temulawak": 0, "Zonk": 0]
    )

    
    
    var body: some View {
        MainView()
            .environmentObject(screenRouter)
            .environmentObject(user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
