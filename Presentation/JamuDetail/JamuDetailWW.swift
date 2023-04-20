//
//  SwiftUIView.swift
//  
//
//  Created by Evan Susanto on 16/04/23.
//

import SwiftUI

struct JamuDetailsWW: View {
        @EnvironmentObject var user: User
    
    var jamu: Jamu = jamuKunyitAsam
    
//    var user: User = User(
//        name: "Evan Susanto",
//        inventoryIngridient: ["Tamarind": 0, "Rice": 0, "Chili": 0, "Salt": 0, "Palm Sugar": 0, "Ginger": 0, "Cinnamon": 0, "Galangal": 0, "Turmeric": 0, "Honey": 0, "Andrographis": 0, "Lemongrass": 0, "Betel Leaf": 0, "Curcuma": 0],
//        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih": 0, "Temulawak": 0, "Zonk": 0]
//    )

    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                JColor.gradientPurple
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
                                    Image(jamu.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width:110,height: 110)
                                        .padding(.leading,6)
                                }
                                
                                .padding(.top,-geo.size.height*0.1)
                                ScrollView(showsIndicators: false){
                                    VStack(alignment: .center, spacing: 10){
                                        HStack{
                                            Text(jamu.name)
                                                .bold()
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 25))
                                            Rectangle()
                                                .fill(getFillColor())
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
                                                    
                                                    
                                                    Text(jamu.rarity.rawValue)
                                                        .font(JFont.semiBold(fontFamily: .poppins,size: 14))
                                                        .foregroundColor(.white)
                                                    
                                                )
                                            
                                        }
                                        Spacer()
                                            .frame(height: ViewPadding.small)
                                        HStack(spacing: 20){
                                            ForEach(jamu.jamuReceipts){jamuReceipt in
                                                DetailIngredientView(ingridient: jamuReceipt.ingridient, count: jamuReceipt.quantity)
                                            }
                                        }
                                        
                                        
                                        Spacer()
                                            .frame(height: ViewPadding.small)
                                        Group{
                                            
                                            Text("Jamu " + jamu.name)
                                                .font(JFont.bold(fontFamily: .poppins, size: 25))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            HStack{
                                                Text("You Have In Your Inventory : \(user.inventoryJamu[jamu.name]!)")
                                                    .font(JFont.regular(fontFamily: .poppins, size: 15))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                                    .padding(.horizontal, ViewPadding.xlarge)
                                                
                                                
                                            }
                                            
                                            
                                            Text("Description")
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 20))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            Text(jamu.jamuDescription)
                                                .lineSpacing(8)
                                            
                                                .font(JFont.regular(fontFamily: .poppins,size: 12))
                                                .multilineTextAlignment(.leading)
                                                .padding(.horizontal, ViewPadding.large)
                                            Text("Effect: \(getText())")
                                                .font(JFont.semiBold(fontFamily: .poppins, size: 20))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .padding(.horizontal, ViewPadding.xlarge)
                                            
                                            
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

extension JamuDetailsWW{
    func getFillColor() -> LinearGradient {
        switch jamu.rarity {
        case .epic:
            return JColor.gradientPurple
        case .rare:
            return JColor.gradientBlue
        case .common:
            return JColor.gradientOrangeBG
           default:
               return JColor.gradientRedBG
           }
       }
    
    func getText() -> String {
        switch jamu.rarity {
        case .epic:
            return "Epic Potion: +15 HP"
        case .rare:
            return "Rare Potion: +10 HP"
        case .common:
            return "Common Potion: +5 HP"
           default:
               return "Zonk Potion: -20 HP"
           }
       }
}


struct JamuDetailsWWView_Previews: PreviewProvider {
    static var previews: some View {
        JamuDetailsWW(jamu: jamuJahe)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
