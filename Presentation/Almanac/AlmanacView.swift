//
//  AlmanacView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct AlmanacView: View {
    @State var isClicked: Any = asamJawa
    @EnvironmentObject var screenRouter: ScreenRouter
        @EnvironmentObject var user: User
//    var user: User = User(
//        name: "Evan Susanto",
//        inventoryIngridient: ["Tamarind": 0, "Rice": 0, "Chili": 0, "Salt": 0, "Palm Sugar": 0, "Ginger": 0, "Cinnamon": 0, "Galangal": 0, "Turmeric": 0, "Honey": 0, "Andrographis": 0, "Lemongrass": 0, "Betel Leaf": 0, "Curcuma": 0],
//        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih": 0, "Temulawak": 0, "Zonk": 0]
//    )


    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack {
                    HStack(spacing: 0){
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 40){
                                ForEach(ingridients) { ingridient  in
                                    IngridientCardView(ingridient: ingridient,withCount: false)
                                        .onTapGesture {
                                            isClicked = ingridient
                                        }
                                }
                            }.frame(maxWidth: 150, maxHeight : .infinity)
                            
                            
                        }
                        Spacer()
                            .frame(width: 10)
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 40){
                                ForEach(jamus) { jamu  in
                                    JamuCardView(jamu: jamu)
                                        .onTapGesture {
                                            isClicked = jamu
                                        }
                                }
                            }.frame(maxWidth: 150, maxHeight : .infinity)
                            
                            
                        }
                        Spacer()
                        if isClicked is Ingredient {
                            IngredientsDetailView(ingridient: isClicked as! Ingredient)
                        }
                            else if isClicked is Jamu {
                                JamuDetailsWW(jamu: isClicked as! Jamu)
                            }
                            
                            //                        JamuDetailsWW(jamu: jamuClicked)
                            //                        IngredientsDetailView(ingridient: ingredientsClicked)
                        }
                    }
                    VStack{
                        Spacer()
                        HStack{
                            NavigatePage(image: "button_brew", destination: .jamu, geo: geo)
                            
                            Spacer()
                            NavigatePage(image: "button_save", destination: .hero, geo: geo)
                        }.padding(.horizontal, ViewPadding.xlarge)
                            .padding(.leading, geo.size.width * 0.22)
                    }
                }
            }
        }
        
    }

struct AlmanacView_Previews: PreviewProvider {
    static var previews: some View {
        AlmanacView()
            .previewInterfaceOrientation(.landscapeLeft)
        
    }
}
