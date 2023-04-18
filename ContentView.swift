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
        inventoryIngridient: ["Asam Jawa": 0, "Beras": 0, "Cabe": 0, "Garam": 0, "Gula Aren": 0, "Jahe": 0, "Kayu Manis": 0, "Kencur": 0, "Kunyit": 0, "Madu": 0, "Sambiloto": 0, "Serai": 0, "Sirih": 0, "Temulawak": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih": 0, "Temulawak": 0, "Zonk": 0]
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
