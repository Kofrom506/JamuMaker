//
//  GatherView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//


import SwiftUI

struct GatherView: View{
    @EnvironmentObject var user: User
    @StateObject var vm: GatherViewModel
//    var user: User = User(
//        name: "Evan Susanto",
//        inventoryIngridient: ["Asam Jawa": 0, "Beras": 0, "Cabe": 0, "Garam": 0, "Gula Aren": 0, "Jahe": 0, "Kayu Manis": 0, "Kencur": 0, "Kunyit": 0, "Madu": 0, "Sambiloto": 0, "Serai": 0, "Sirih": 0, "Temulawak": 0, "Error": 0],
//        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
//    )
    
    var body: some View{
        GeometryReader{ geo in
            ZStack{
                Image("background_jakarta")
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
                    startGame(size: geo.size)
                }
            }
        }
    }
    func startGame(size: CGSize) {
        placeHerbRandomly(in: size)
        Timer.scheduledTimer(withTimeInterval: vm.timerInterval, repeats: true) { _ in
            updateHerb()
        }

    }

    func placeHerbRandomly(in size: CGSize) {
        vm.ingridients_temp.indices.forEach { index in
            var ingridient = ingridients[index]
            ingridient.position = CGPoint(x: CGFloat.random(in: 0..<size.width * 2/3), y: CGFloat.random(in: 0..<size.height * 1/4))
            vm.ingridients_temp[index] = ingridient
        }
    }

    func updateHerb() {
        let randomIndex = Int.random(in: 0..<vm.ingridients_temp.count)
        vm.ingridients_temp[randomIndex].isUp.toggle()
    }

    func endGame() {
        vm.ingridients_temp.removeAll()
    }

}


struct GatherView_Previews: PreviewProvider {

    static var previews: some View {
        GatherView(vm: GatherViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

