//
//  GatherView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//


import SwiftUI

struct GatherView: View{
    @EnvironmentObject var screenRouter:  ScreenRouter
    
    @EnvironmentObject var user: User
    @StateObject var vm: GatherViewModel
    var locationBackground: String = ""
//    var user: User = User(
//        name: "Evan Susanto",
//        inventoryIngridient: ["Tamarind": 0, "Rice": 0, "Chili": 0, "Salt": 0, "Palm Sugar": 0, "Ginger": 0, "Cinnamon": 0, "Galangal": 0, "Turmeric": 0, "Honey": 0, "Andrographis": 0, "Lemongrass": 0, "Betel Leaf": 0, "Curcuma": 0],
//        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
//    )
    
    
    var body: some View{
        GeometryReader{ geo in
            ZStack{
                
                Image("background_"+user.userLocation.rawValue.lowercased())
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                HStack(alignment: .center){
                    Spacer()
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 40){
                            ForEach(user.inventoryIngridient.sorted(by: <), id: \.key) { key, value  in
                                switch key {
                                case "Tamarind":
                                    IngridientCardView(ingridient: asamJawa, count: value)
                                case "Rice":
                                    IngridientCardView(ingridient: beras, count: value)
                                case "Chili":
                                    IngridientCardView(ingridient: cabe, count: value)
                                case "Salt":
                                    IngridientCardView(ingridient: garam, count: value)
                                case "Palm Sugar":
                                    IngridientCardView(ingridient: gulaAren, count: value)
                                case "Ginger":
                                    IngridientCardView(ingridient: jahe, count: value)
                                case "Cinnamon":
                                    IngridientCardView(ingridient: kayuManis, count: value)
                                case "Galangal":
                                    IngridientCardView(ingridient: kencur, count: value)
                                case "Turmeric":
                                    IngridientCardView(ingridient: kunyit, count: value)
                                case "Honey":
                                    IngridientCardView(ingridient: madu, count: value)
                                case "Andrographis":
                                    IngridientCardView(ingridient: sambiloto, count: value)
                                case "Lemongrass":
                                    IngridientCardView(ingridient: serai, count: value)
                                case "Betel Leaf":
                                    IngridientCardView(ingridient: sirih, count: value)
                                case "Curcuma":
                                    IngridientCardView(ingridient: temulawak, count: value)
                                default:
                                    IngridientCardView(ingridient: bahanError, count: value)
                                }
                                
                            }
                            
                        }.frame(maxWidth: 200, maxHeight : .infinity)
                        
                        
                    }.frame(maxHeight : .infinity)
                  
                    
                    
                }
                VStack{
                    ForEach(vm.ingridients_temp) { ingridient in
                        if(ingridient.location.contains(user.userLocation)){
                       
                            Image(ingridient.isUp ? ingridient.imageName : "")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .foregroundColor(.pink)
                                .position(ingridient.position)
                                .onTapGesture {
                                    for i in 0..<vm.ingridients_temp.count{
                                        if vm.ingridients_temp[i].id == ingridient.id{
                                            if vm.ingridients_temp[i].isUp{
                                                vm.ingridients_temp[i].isUp = false
                                                print(ingridient)
                                                self.user.inventoryIngridient[ingridient.name]!+=1
                                            }
                                            
                                            //                                        print(user.inventoryIngridient)
                                        }
                                    }
                                }
                            
                        }
                    }
                    
                    
                }
                VStack{
                    Spacer()
                        .frame(height: geo.size.height*0.75)
                    
                    HStack{
                        
                        Image("button_map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.15)
         
                            .onTapGesture {
                                screenRouter.dismissLast()
                            }
                        Spacer()
                        
                    }.padding(.horizontal, ViewPadding.xlarge)
                }
                .onAppear {
                    vm.startGame(size: geo.size)
                }
            }
        }
    }
    
    
}


struct GatherView_Previews: PreviewProvider {
    
    static var previews: some View {
        GatherView(vm: GatherViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

