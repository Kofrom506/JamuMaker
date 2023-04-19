//
//  SwiftUIView.swift
//
//
//  Created by Evan Susanto on 16/04/23.
//

import SwiftUI

struct IngredientsDetailView: View {
    //    @EnvironmentObject var user: User
    var ingridient: Ingredient = asamJawa
    var user: User = User(
        name: "Evan Susanto",
        inventoryIngridient: ["Tamarind": 0, "Rice": 0, "Chili": 0, "Salt": 0, "Palm Sugar": 0, "Ginger": 0, "Cinnamon": 0, "Galangal": 0, "Turmeric": 0, "Honey": 0, "Andrographis": 0, "Lemongrass": 0, "Betel Leaf": 0, "Curcuma": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
    )

    var body: some View {
        GeometryReader { geo in
            ZStack {
                JColor.gradientGreenBG
                    .ignoresSafeArea()
                VStack{
                    Image("background")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .blendMode(.softLight)
                        .ignoresSafeArea()
                    Spacer()
                }
                
                VStack(alignment: .center) {
                    Spacer()
                        .frame(height: geo.size.height*0.1)
                    Rectangle()
                    //                        .cornerRadius(40, corners: [)
                        .cornerRadius(40)
                        .foregroundColor(JColor.white)
                        .frame(maxHeight: .infinity)
                        .overlay(
                            VStack(alignment: .center, spacing: 10, content: {
                                Spacer()
                                    .frame(height: 20)
                                ZStack{
                                    Circle()
                                        .foregroundColor(JColor.white)
                                        .frame(width:145)
                                        .shadow(radius: 10)
                                    Image(ingridient.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:110,height: 110)
                                        .padding(.leading,6)
                                }
                                
                                .padding(.top,-geo.size.height*0.1)
                                ScrollView(showsIndicators: false){
                                    VStack(alignment: .center, spacing: 10){
                                        HStack{
                                            Text(ingridient.name)
                                                .bold()
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 40))
                                            Rectangle()
                                                .fill(JColor.gradientGreenCardBG)
//                                            if(jamu.rarity == .epic){
//                                                .fill(JColor.gradientPurple)
//                                            }else if(jamu.rarity == .rare){
//                                                .fill(JColor.gradientBlue)
//                                            }
//                                            else if(jamu.rarity == .common){
//                                                .fill(JColor.gradientGreenBG)}else{
//                                                    .fill(JColor.gradientGreenBG)}
                                                .cornerRadius(20)
                                                .frame(width: 86, height: 33)
                                                .overlay(
                                                    
                                                    
                                                    Text("Herbal")
                                                        .font(JFont.semiBold(fontFamily: .poppins,size: 14))
                                                        .foregroundColor(.white)
                                                    
                                                )
                                            
                                        }
                                        Spacer()
                                            .frame(height: ViewPadding.small)
                                        HStack(spacing: 20){
                                            ForEach(ingridient.location){location in
                                                DetailLocationView(location: location)
                                            }
                                        }
                                        
                                        
                                        Spacer()
                                            .frame(height: ViewPadding.small)
                                        Group{
                                            Text(ingridient.name)
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 40))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            HStack{
                                                
                                            }
                                            Text("You Have in Your Inventory : \(user.inventoryIngridient[ingridient.name]!)")
                                                .font(JFont.regular(fontFamily: .poppins, size: 15))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            
                                            
                                            
                                            Text("Description")
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 25))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            Text(ingridient.description)
                                                .lineSpacing(8)
                                                .padding(.horizontal,ViewPadding.xxlarge)
                                                .font(JFont.regular(fontFamily: .poppins,size: 12))
                                                .multilineTextAlignment(.leading)
                                            
                                            //                                            Text("Earn 20 XP for each wish made and level up to the next value stage of your stone!")
                                            //                                                .lineSpacing(8)
                                            //                                                .padding(.horizontal,ViewPadding.xxlarge)
                                            //                                                .font(JFont.regular(fontFamily: .poppins,size: 12))
                                            //                                                .multilineTextAlignment(.leading)
                                            Spacer()
                                                .frame(height: ViewPadding.mini)
                                        }
                                        
                                        
                                        
                                        
                                        
                                        
                                        Spacer()
                                        
                                        
                                    }
                                }
                                
                                
                            })
                        ).ignoresSafeArea()
                    //                    Spacer()
                    
                }.frame(width: geo.size.width, height: .infinity)
                
                
                
            }
            
        }
        
    }
}


struct IngredientsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsDetailView(ingridient: asamJawa)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
