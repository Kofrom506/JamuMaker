//
//  HeroView.swift
//  jamuMaking
//
//  Created by Evan Susanto on 24/03/23.
//

import SwiftUI

struct HeroView: View {
    @State var showImage: Bool = true
    @State private var isTapped = false
    //    @EnvironmentObject var user: User
    @State var jamuClicked: Jamu = jamuKunyitAsam
    var user: User = User(
        name: "Evan Susanto",
        inventoryIngridient: ["Asam Jawa": 0, "Beras": 0, "Cabe": 0, "Garam": 0, "Gula Aren": 0, "Jahe": 0, "Kayu Manis": 0, "Kencur": 0, "Kunyit": 0, "Madu": 0, "Sambiloto": 0, "Serai": 0, "Sirih": 0, "Temulawak": 0],
        inventoryJamu: ["Beras Kencur": 0,"Cabe Puyang": 0, "Empon-Empon": 0,"Jahe": 0,"Jakutes": 0,"Kayu Manis": 0,"Kunyit Asam": 0,"Kunyit Madu": 0,"Sambiloto": 0,"Sirih Temulawak": 0, "Zonk": 0]
    )
    @State var health: Int = 0
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                HStack{
                VStack{
                   
                        ProgressBar(colorProgress: Color.red, colorBackground: JColor.white_level_progress, value: $health, maxValue: 100)
                        Button("Press") {
                            self.health-=20
                        }
                        
                        Text("Press")
                            .onTapGesture {
                                switch jamuClicked.rarity{
                                case .epic:
                                    self.health+=20
                                    withAnimation {
                                        self.isTapped.toggle()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            self.isTapped.toggle()
                                        }
                                        
                                    }
                                case .rare:
                                    self.health+=10
                                case .common:
                                    self.health+=5
                                case .zonk:
                                    self.health-=20
                                }
                                
                            }
                    Image(isTapped ? "girl_happy" : "girl_spit")
                        .resizable()
                        .transition(.opacity)
                        .scaledToFit()
//                        if showImage {
//                            Image("boy_happy")
//                                .resizable()
//                                .transition(.opacity)
//                                .scaledToFit()
//                        } else {
//                            Image("boy_sick")
//                                .resizable()
//                                .transition(.opacity)
//                                .scaledToFit()
//                        }
                        
                        
                    }
                    Spacer()
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 40){
                            ForEach(jamus) { jamu  in
                                JamuCardView(jamu: jamu)
                                    .onTapGesture {
                                        jamuClicked = jamu
                                    }
                            }
                        }.frame(maxWidth: 150, maxHeight : .infinity)
                        
                
                    }
                    
                }.padding(.horizontal, ViewPadding.medium)
                VStack{
                    Spacer()
                    HStack{
                        
                        NavigatePage(image: "button_almanac", destination: .almanac, geo: geo)
                        Spacer()
                        NavigatePage(image: "button_gather", destination: .gather, geo: geo)
                    }.padding(.horizontal, ViewPadding.large)
                }
            }
            
        }
        .onAppear{
            onAppear()
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                withAnimation {
                    showImage.toggle()
                }
            }
            
        }
    }
}


extension HeroView {
    
    func damaged() {
        //        placeHerbRandomly(in: size)
        //        Timer.scheduledTimer(withTimeInterval: vm.timerInterval, repeats: true) { _ in
        //            updateHerb()
        //        }
        
    }
    
    private func onAppear() {
        Task {
            self.health = user.health
            
        }
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

