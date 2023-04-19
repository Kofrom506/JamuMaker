//
//  GatherView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//


import SwiftUI

struct GatherViewPapua: View{
//    @EnvironmentObject var user: User
    @StateObject var vm: GatherViewModel
    var user: User = User(
        name: "Evan Susanto",
        inventoryIngridient: ["Tamarind": 0, "Rice": 0, "Chili": 0, "Salt": 0, "Palm Sugar": 0, "Ginger": 0, "Cinnamon": 0, "Galangal": 0, "Turmeric": 0, "Honey": 0, "Andrographis": 0, "Lemongrass": 0, "Betel Leaf": 0, "Curcuma": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
    )

    
    var body: some View{
        GeometryReader{ geo in
            ZStack{
                Image("background_papua")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                HStack(alignment: .center){
                    Image("background_garden")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.85)
                    //                        .background(.red)
                        .ignoresSafeArea()
                    
                    
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 40){
                            ForEach(user.inventoryIngridient.sorted(by: <), id: \.key) { key, value  in
                                switch key {
                                case "Asam Jawa":
                                    IngridientCardView(ingridient: asamJawa, count: value)
                                case "Beras":
                                    IngridientCardView(ingridient: beras, count: value)
                                case "Cabe":
                                    IngridientCardView(ingridient: cabe, count: value)
                                case "Garam":
                                    IngridientCardView(ingridient: garam, count: value)
                                case "Gula Aren":
                                    IngridientCardView(ingridient: gulaAren, count: value)
                                case "Jahe":
                                    IngridientCardView(ingridient: jahe, count: value)
                                case "Kayu Manis":
                                    IngridientCardView(ingridient: kayuManis, count: value)
                                case "Kencur":
                                    IngridientCardView(ingridient: kencur, count: value)
                                case "Kunyit":
                                    IngridientCardView(ingridient: kunyit, count: value)
                                case "Madu":
                                    IngridientCardView(ingridient: madu, count: value)
                                case "Sambiloto":
                                    IngridientCardView(ingridient: sambiloto, count: value)
                                case "Serai":
                                    IngridientCardView(ingridient: serai, count: value)
                                case "Sirih":
                                    IngridientCardView(ingridient: sirih, count: value)
                                case "Temulawak":
                                    IngridientCardView(ingridient: temulawak, count: value)
                                default:
                                    IngridientCardView(ingridient: bahanError, count: value)
                                }
                                
                            }
                            
                        }.frame(maxWidth: 200, maxHeight : .infinity)
                        
                        
                    }.frame(maxHeight : .infinity)
                    //                        .background(.red)
                    
                    
                    //                    ScrollView(showsIndicators: false) {
                    //                        VStack{
                    //                            ForEach(vm.ingridients_temp){ingridient in
                    //                                IngridientCardView(ingridient: ingridient)
                    //                            }
                    //                        }
                    //                    }
                    
                    
                }
                VStack{
                    ForEach(vm.ingridients_temp) { ingridient in
                        Image(ingridient.isUp ? ingridient.imageName : "")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                            .foregroundColor(.pink)
                            .position(ingridient.position)
                            .onTapGesture {
                                for i in 0..<vm.ingridients_temp.count{
                                    if vm.ingridients_temp[i].id == ingridient.id{
                                        vm.ingridients_temp[i].isUp = false
                                        print(ingridient)
                                        self.user.inventoryIngridient[ingridient.name]!+=1
                                        //                                        print(user.inventoryIngridient)
                                    }
                                    
                                }
                                
                            }
                    }
                }
                VStack{
                    Spacer()
                        .frame(height: geo.size.height*0.75)
                    
                    HStack{
                        
                        NavigatePage(image: "button_menu", destination: .home, geo: geo)
                        Spacer()
                        NavigatePage(image: "button_brew", destination: .jamu, geo: geo)
                    }.padding(.horizontal, ViewPadding.xlarge)
                }.padding(.bottom, ViewPadding.xxxlarge)
                    .onAppear {
                        vm.startGame(size: geo.size)
                    }
            }
        }
    }
    
    
}


struct GatherViewPapua_Previews: PreviewProvider {
    
    static var previews: some View {
        GatherViewPapua(vm: GatherViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

