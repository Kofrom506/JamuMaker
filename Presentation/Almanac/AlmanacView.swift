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
//        @EnvironmentObject var user: User
    var user: User = User(
        name: "Evan Susanto",
        inventoryIngridient: ["Asam Jawa": 0, "Beras": 0, "Cabe": 0, "Garam": 0, "Gula Aren": 0, "Jahe": 0, "Kayu Manis": 0, "Kencur": 0, "Kunyit": 0, "Madu": 0, "Sambiloto": 0, "Serai": 0, "Sirih": 0, "Temulawak": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
    )
    //    @State var ingredientsClicked: Ingredient = asamJawa
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack {
                    HStack(spacing: 0){
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 40){
                                ForEach(ingridients) { ingridient  in
                                    IngridientCardView(ingridient: ingridient)
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
