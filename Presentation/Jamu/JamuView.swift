//
//  JamuView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct JamuView: View {
    
//    @EnvironmentObject var user: User
    @StateObject var myIngridients:IngridientsUsage = IngridientsUsage()
    @StateObject var vm: JamuViewModel

    var user: User = User(
        name: "Evan Susanto",
        inventoryIngridient: ["Asam Jawa": 0, "Beras": 0, "Cabe": 0, "Garam": 0, "Gula Aren": 0, "Jahe": 0, "Kayu Manis": 0, "Kencur": 0, "Kunyit": 0, "Madu": 0, "Sambiloto": 0, "Serai": 0, "Sirih": 0, "Temulawak": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
    )

    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("background_brew")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    HStack{
                        NavigatePage(image: "button_gather", destination: .gather, geo: geo)
                      
                        Spacer()
                        NavigatePage(image: "button_almanac", destination: .almanac, geo: geo)
                    }.padding(.horizontal, ViewPadding.xlarge)
                }
                VStack{
                    Spacer()
//                    RoundedRectangle(cornerRadius: 10)
//                        .frame(width: 300, height: 300)
//                        .overlay(CarouselView())
//                    HStack{
//
////                            .overlay(<#T##self: RoundedRectangle##RoundedRectangle#>)
//                        Spacer()
//
//                        Spacer()
//                    }
                    
                        
                    HStack(spacing: ViewPadding.xxxlarge){
                        VStack{

                            ForEach(myIngridients.ingridientsU[0...myIngridients.ingridientsU.count/2-1]) { ingridientU in

                                AddSubstractValue(title: ingridientU.ingridient.name, ingridientUsage: ingridientU,max: user.inventoryIngridient[ingridientU.ingridient.name]!)
                                    .padding(.vertical, ViewPadding.small)
                            }
                        }.background(
                            RoundedRectangle(
                                cornerRadius: 20
                                
                            ).foregroundColor(.white)
                                .opacity(0.8)
                                .padding(-20)
                        )

                        Divider()
                            .overlay(.black)
                            .frame(height: geo.size.height*1/3)
                        VStack{
                            ForEach(myIngridients.ingridientsU[myIngridients.ingridientsU.count/2...myIngridients.ingridientsU.count-1]) { ingridientU in
                                AddSubstractValue(title: ingridientU.ingridient.name, ingridientUsage: ingridientU, max: user.inventoryIngridient[ingridientU.ingridient.name]!)
                                    .padding(.vertical, ViewPadding.small)
                            }
                        }.background(
                            RoundedRectangle(
                                cornerRadius: 20
                                
                            ).foregroundColor(.white)
                                .opacity(0.8)
                                .padding(-20)
                        )
                    }
                    Spacer()
                  
                    
                   
                    Text(vm.text)
                    HStack {
                        Image("penumbuk")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width*1/6)
                        Image("kettle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width*1/4)
                            .shadow(color: Color.yellow.opacity(0.5), radius: 10)
                            .onTapGesture {
                                for i in 0...myIngridients.ingridientsU.count-1 {
                                    vm.text.append(String(repeating: myIngridients.ingridientsU[i].ingridient.code, count: myIngridients.ingridientsU[i].usage))
                                    
                                }
                                for i in 0...myIngridients.ingridientsU.count-1 {
                                    myIngridients.ingridientsU[i].usage = 0
                                    
                                }
                                
                                
                                self.myIngridients.objectWillChange.send()
                             
                                if(brew(textReceipt: vm.text, jamus: jamus).name == "Zonk"){
                                    user.inventoryJamu["Zonk"]!+=1
                                }else{
                                    user.inventoryJamu[brew(textReceipt: vm.text, jamus: jamus).name]!+=1
                                }
                                vm.text = ""
                                print(user.inventoryJamu)
                                
                            }
                        
                        Image("jug")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width*1/6)
                            .scaledToFit()
                                        .aspectRatio(contentMode: .fit)
                                        .rotationEffect(vm.isWater ? Angle(degrees: -45) : Angle(degrees: 0))
                                        .animation(.easeInOut(duration: 0.5))
                                        .onTapGesture {
                                            withAnimation {
                                                self.vm.isWater.toggle()
                                            }
                                        }
                                        .padding(.bottom, 50)
                    }
                    
                    
                }
                .padding(.horizontal,ViewPadding.large)
            }
        }
    }
    
}


extension JamuView{
    func brew(textReceipt: String, jamus: [Jamu] ) -> Jamu{
        for jamu in jamus{
            if(textReceipt == jamu.codes){
                return jamu
            }
        }
        return jamuZonk
    }
    
    //    func brew(ingridientsU: [IngridientsUsage]) -> String {
    //        let aa = ingridientsU.filter { ingridient in
    //            return ingridient.usage>0
    //        }.map { ingridient in
    //            ingridient.ingridient.
    //        }
    //        return ""
    //    }
    
    
    //    func brew(ingridientsU: [IngridientsUsage]) -> String{
    //        var recept: String = ""
    //        for usage in ingridientsU {
    //            switch usage {
    //            case jaheU:
    //                recept.append(multiply(count: usage.usage, character: "A"))
    //            case kunyitU:
    //                recept.append(multiply(count: usage.usage, character: "B"))
    //            case temulawakU:
    //                recept.append(multiply(count: usage.usage, character: "C"))
    //            case kayuManisU:
    //                recept.append(multiply(count: usage.usage, character: "D"))
    //            case daunSirihU:
    //                recept.append(multiply(count: usage.usage, character: "E"))
    //            case sambilotoU:
    //                recept.append(multiply(count: usage.usage, character: "F"))
    //            case cabeJawaU:
    //                recept.append(multiply(count: usage.usage, character: "G"))
    //            case bawangPutihU:
    //                recept.append(multiply(count: usage.usage, character: "H"))
    //            case daunKemangiU:
    //                recept.append(multiply(count: usage.usage, character: "I"))
    //            default:
    //                return ""
    //            }
    //
    //        }
    //        return recept
    //    }
    //
    func multiply(count: Int, character: String )->String{
        var text: String = ""
        for _ in 0..<count {
            text.append(character)
        }
        return text
    }
    
}

struct JamuView_Previews: PreviewProvider {
    static var previews: some View {
        JamuView(vm:JamuViewModel())
            .previewInterfaceOrientation(.landscapeLeft)
    }
}