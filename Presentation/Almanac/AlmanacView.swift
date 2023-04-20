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
