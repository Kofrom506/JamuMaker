//
//  JamuView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct JamuView: View {
    
    @EnvironmentObject var user: User
    @StateObject var myIngridients:IngridientsUsage = IngridientsUsage()
    @StateObject var vm: JamuViewModel
    @State var isShowingAlert: Bool = false
    @State var textAlert: String = ""
    

    
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Image("background_brew")
                    .resizable()
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    HStack{
                        NavigatePage(image: "button_gather", destination: .map, geo: geo)
                        
                        Spacer()
                        NavigatePage(image: "button_almanac", destination: .almanac, geo: geo)
                    }.padding(.horizontal, ViewPadding.xlarge)
                }
                VStack{
                    Spacer()
                    
                    
                    
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
                            .scaleEffect(vm.isClicked ? 1.5 : 1, anchor: .center)
                        
                        Image("kettle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width*1/4)
                            .shadow(color: Color.yellow.opacity(0.5), radius: 10)
                            .rotation3DEffect(vm.isClicked ? Angle.degrees(720) : Angle.degrees(0), axis: (x: 0, y: 1, z: 0))
                            .alert(textAlert, isPresented: $isShowingAlert) {
                                Button("OK", role: .cancel) { }
                            }
                            .onTapGesture {
                                for i in 0...myIngridients.ingridientsU.count-1 {
                                    vm.text.append(String(repeating: myIngridients.ingridientsU[i].ingridient.code, count: myIngridients.ingridientsU[i].usage))
                                    
                                }
                                for i in 0...myIngridients.ingridientsU.count-1 {
                                    
                                    myIngridients.ingridientsU[i].usage = 0
                                    
                                }
                                
                                
                                self.myIngridients.objectWillChange.send()
                                isShowingAlert.toggle()
                                if(vm.text != ""){
                                    if(brew(textReceipt: vm.text, jamus: jamus).name == "Zonk"){
                                        user.inventoryJamu["Zonk"]!+=1
                                        textAlert = "Sorry 😭 You Got Poisonous Jamu \(brew(textReceipt: vm.text, jamus: jamus).name) "
                                    }else{
                                        user.inventoryJamu[brew(textReceipt: vm.text, jamus: jamus).name]!+=1
                                        textAlert = "Congratulations You Got Jamu \(brew(textReceipt: vm.text, jamus: jamus).name) 🎉"
                                    }
                                }else{
                                    textAlert = "Jamu Making Failed Because there is no ingredient input 😥"
                                }
                                user.inventoryIngridient["Tamarind"]! -= vm.text.filter{$0 == "A"}.count
                                user.inventoryIngridient["Rice"]! -= vm.text.filter{$0 == "B"}.count
                                user.inventoryIngridient["Chili"]! -= vm.text.filter{$0 == "C"}.count
                                user.inventoryIngridient["Salt"]! -= vm.text.filter{$0 == "D"}.count
                                user.inventoryIngridient["Palm Sugar"]! -= vm.text.filter{$0 == "E"}.count
                                user.inventoryIngridient["Ginger"]! -= vm.text.filter{$0 == "F"}.count
                                user.inventoryIngridient["Cinnamon"]! -= vm.text.filter{$0 == "G"}.count
                                user.inventoryIngridient["Galangal"]! -= vm.text.filter{$0 == "H"}.count
                                user.inventoryIngridient["Turmeric"]! -= vm.text.filter{$0 == "I"}.count
                                user.inventoryIngridient["Honey"]! -= vm.text.filter{$0 == "J"}.count
                                user.inventoryIngridient["Andrographis"]! -= vm.text.filter{$0 == "K"}.count
                                user.inventoryIngridient["Lemongrass"]! -= vm.text.filter{$0 == "L"}.count
                                user.inventoryIngridient["Betel Leaf"]! -= vm.text.filter{$0 == "M"}.count
                                user.inventoryIngridient["Curcuma"]! -= vm.text.filter{$0 == "N"}.count
                                
                                vm.text = ""
                                print(user.inventoryJamu)
                                
                                withAnimation {
                                    self.vm.isClicked.toggle()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                        self.vm.isClicked.toggle()
                                    }
                                }
                            }
                        
                        Image("jug")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width*1/6)
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(vm.isClicked ? Angle(degrees: -45) : Angle(degrees: 0))
                        
                        
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
